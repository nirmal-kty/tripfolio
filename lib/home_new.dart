import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:project_new/ambulance_mode.dart';
import 'package:project_new/map_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'Drawer.dart'; // Ensure you import your Drawer class

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userAddress = "151-171 Montclair Ave, Newark, NJ 07104, USA";
  String? selectedAlert;
  String _currentLocationStatus = "Press the button to get the location";
  double? _latitude;
  double? _longitude;
  String username = 'User';
  final MapController _mapController = MapController();
  LatLng? currentLocation = LatLng(11.2588, 75.7804);
  List<Ambulance> fetchedAmbulances = [];
  bool _isMapReady = false;

  Timer? _ambulanceTimer;

  @override
  void initState() {
    _fetchambulancesOnInit();
    _ambulanceTimer = Timer.periodic(
      const Duration(seconds: 3),
          (timer) {
        loadnot();
      },
    );

    showUsername();


    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isMapReady = true;
      });
    });
    super.initState();
  }


  Future<void> _fetchambulancesOnInit() async {
    await fetchAmbulances();
  }
  bool _isFullScreen = false;

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  bool _isHelp = false;

  void _toggleHelp() {
    setState(() {
      _isHelp = !_isHelp;
    });
  }

  Future<String?> getUsername() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? lid = sh.getString('lid');
    String? url = sh.getString('url');
    print(url);

    try {
      final response = await http.get(Uri.parse(url! + 'get-username/$lid/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['username'];
      } else {
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<void> showUsername() async {
    String? fetchedUsername = await getUsername();
    if (fetchedUsername != null) {
      setState(() {
        username = fetchedUsername;
      });
    } else {
      print('User not found or error occurred');
    }
  }

  Future<bool> sendSOSRequest({bool bypassProximityCheck = false}) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? url = sh.getString('url');
    String? lid = sh.getString('lid');

    if (url == null || lid == null || url.isEmpty || lid.isEmpty) {
      Fluttertoast.showToast(msg: 'Invalid URL or ID');
      return false;
    }

    // Ensure the URL has a trailing slash
    if (!url.endsWith('/')) {
      url += '/';
    }

    final requestUrl = Uri.parse(url + 'user_send_ambulance_request');

    try {
      final response = await http.post(requestUrl, body: {
        'lid': lid,
        'latitude': _latitude.toString(),
        'longitude': _longitude.toString(),
        'bypass':
        bypassProximityCheck ? 'true' : 'false', // New field for bypass
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        print(status + '+=++++++++++++++++++++++++++++++++++++');
        if (!bypassProximityCheck && status == 'close') {
          bool userConfirmation = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Nearby Request Detected"),
              content: const Text(
                  "There is an existing request nearby. Are you sure you want to proceed?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    await sendSOSRequest(bypassProximityCheck: true);
                    Navigator.pop(context, true);
                    Fluttertoast.showToast(
                        msg: 'Network Error (Status: ${response.statusCode})');
                  },
                  child: const Text("Proceed"),
                ),
              ],
            ),
          );

          return userConfirmation;
        }
        Fluttertoast.showToast(
            msg: status == 'ok' ? 'Request Sent' : 'Already Sent!');
        return status == 'ok';
      } else {
        Fluttertoast.showToast(
            msg: 'Network Error (Status: ${response.statusCode})');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Request Failed: $e');
      return false;
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _currentLocationStatus = 'Location permissions are denied';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _currentLocationStatus =
          'Location permissions are permanently denied';
        });
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        // _mapController.move(currentLocation!, 14.0);
      });

      _latitude = position.latitude;
      _longitude = position.longitude;

      setState(() {
        _currentLocationStatus = currentLocation.toString();
      });
    } catch (e) {
      setState(() {
        _currentLocationStatus = 'Unable to fetch location: $e';
      });
    }
  }

  Future<void> fetchAmbulances() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? url = sh.getString('url');

    final response =
    await http.get(Uri.parse(url! + 'view_nearest_ambulances'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        List<Ambulance> ambulances = (data['data'] as List)
            .map((jsonItem) => Ambulance.fromJson(jsonItem))
            .toList();
        setState(() {
          fetchedAmbulances = ambulances;
        });
      } else {
        throw Exception('Failed to load ambulances: ${data['status']}');
      }
    } else {
      throw Exception('Failed to load ambulances');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return _isFullScreen
        ? Scaffold(
      body: _isMapReady
          ? userMap(fetchedAmbulances, fetchAmbulances(),
          context: context,
          getcurrentLocation: _getCurrentLocation(),
          height: screenheight * 0.3,
          width: screenwidth * 0.8,
          mapController: _mapController,
          currentLocation: currentLocation,
          isFullScreen: _isFullScreen,
          toggleFullScreen: _toggleFullScreen,
          ishelp: _isHelp,
          toggleHelp: _toggleHelp)
          : const Center(child: CircularProgressIndicator()),
    )
        : Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4A90E2),
        elevation: 0,
        title: const Text(
          "Emergency SOS",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A90E2), Color(0xFF145DA0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Need Medical Help?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Ask our AI Chatbot",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),

                        ],
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[
                        100], // Light blue background for chatbot icon
                        child: const Icon(
                          Icons.medical_services,
                          size: 30,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Emergency Message
                const Text(
                  "Are you in emergency?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Press the button below, help will reach you soon.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // SOS Button with Shadow
                GestureDetector(
                  onTap: () {
                    _showConfirmationDialog(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenheight * 0.05),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Colors.redAccent,
                                Colors.deepOrange
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.5),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                          child: const Center(
                            child: Text("data"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _isMapReady
                    ? Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12),
                        child: Row(
                          children: [
                            const Text(
                              "Track Live",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    Colors.red.withOpacity(0.6),
                                    blurRadius: 8,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: userMap(
                          fetchedAmbulances,
                          fetchAmbulances(),
                          context: context,
                          getcurrentLocation: _getCurrentLocation(),
                          height: screenheight * 0.25,
                          width: screenwidth * 0.8,
                          mapController: _mapController,
                          currentLocation: currentLocation,
                          isFullScreen: _isFullScreen,
                          toggleFullScreen: _toggleFullScreen,
                          ishelp: _isHelp,
                          toggleHelp: _toggleHelp,
                        ),
                      ),
                    ],
                  ),
                )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            backgroundColor: const Color(0xFF4A90E2),
            title: const Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Confirm SOS Request",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            content: const Text(
              "This button press will call the ambulance service to your current location. Do you really want to continue?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _getCurrentLocation();
                  sendSOSRequest();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> loadnot() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? url = sh.getString('url');

    final response = await http.post(Uri.parse(url! + 'receive_user_location/'),
        body: {
          'latitude': _latitude.toString(),
          'longitude': _longitude.toString()
        });
    print(url! + 'receive_user_location/');
    print(_latitude.toString());
    print(_longitude.toString());


  }
}
