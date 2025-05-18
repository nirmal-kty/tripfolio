// // // import 'package:flutter/material.dart';
// // //
// // //
// // // import 'Drawer.dart';
// // //
// // //
// // // class home extends StatefulWidget {
// // //   const home({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<home> createState() => homeState();
// // // }
// // //
// // //
// // // class homeState extends State<home> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         backgroundColor: Colors.white,
// // //         appBar: AppBar(
// // //           title: const Text("home"),
// // //         ),
// // //         drawer: const Drawerclass(),
// // //         body: SafeArea(
// // //             child:Container(decoration: BoxDecoration(
// // //
// // //                 image: DecorationImage(
// // //                   image: AssetImage("assets/bus.jpeg"),
// // //                   fit: BoxFit.cover,)
// // //             ),))
// // //     );
// // //   }
// // // }
// // //
// //
// //
// //
// // import 'package:flutter/material.dart';
// // import 'Drawer.dart';
// //
// // class home extends StatefulWidget {
// //   const home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<home> createState() => _homeState();
// // }
// //
// // class _homeState extends State<home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text("home"),
// //       ),
// //       drawer: const Drawerclass(),
// //       body: SafeArea(
// //         child: Center(
// //           child: Container(
// //             width: double.infinity, // Full width
// //             height: double.infinity, // Full height
// //             decoration: const BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage("assets/"),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// // import 'package:flutter/material.dart';
// // import 'Drawer.dart';
// //
// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Home> createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.purple.shade50,
// //       appBar: AppBar(
// //         title: const Text("Bus", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
// //         backgroundColor: Colors.purple,
// //         elevation: 0,
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.person, color: Colors.white),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       drawer: const Drawerclass(),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: EdgeInsets.all(20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(15),
// //                   boxShadow: [
// //                     BoxShadow(color: Colors.black12, blurRadius: 10),
// //                   ],
// //                 ),
// //                 padding: EdgeInsets.all(16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     _buildLocationRow("From", "Location 1", Icons.location_on),
// //                     Divider(),
// //                     _buildLocationRow("To", "Location 2", Icons.pin_drop),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(15),
// //                   boxShadow: [
// //                     BoxShadow(color: Colors.black12, blurRadius: 10),
// //                   ],
// //                 ),
// //                 padding: EdgeInsets.all(16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     _buildInfoRow("Passenger", "01", Icons.person),
// //                     Divider(),
// //                     _buildInfoRow("Type", "TYPE", Icons.directions_bus),
// //                     Divider(),
// //                     _buildInfoRow("Depart", "Sun 3 Jun 2021", Icons.calendar_today),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 30),
// //               ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.purple,
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
// //                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
// //                 ),
// //                 child: Text("SEARCH", style: TextStyle(fontSize: 18, color: Colors.white)),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.white,
// //         selectedItemColor: Colors.purple,
// //         unselectedItemColor: Colors.grey,
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.edit), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ""),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildLocationRow(String title, String value, IconData icon) {
// //     return Row(
// //       children: [
// //         Icon(icon, color: Colors.purple),
// //         SizedBox(width: 10),
// //         Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //         Spacer(),
// //         Text(value, style: TextStyle(fontSize: 16, color: Colors.purple)),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildInfoRow(String title, String value, IconData icon) {
// //     return Row(
// //       children: [
// //         Icon(icon, color: Colors.purple),
// //         SizedBox(width: 10),
// //         Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //         Spacer(),
// //         Text(value, style: TextStyle(fontSize: 16, color: Colors.purple)),
// //       ],
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:project_new/user_profile.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'Drawer.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   Map<String, dynamic>? userProfile;
//
//   Future<void> _fetchUserProfile() async {
//     final sh = await SharedPreferences.getInstance();
//     String url = sh.getString("url").toString();
//     String lid = sh.getString("lid").toString();
//
//     try {
//       var response = await http.post(
//         Uri.parse("$url/viewprofile/"),
//         body: {"lid": lid},
//       );
//
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             userProfile = data['user'];
//           });
//           _showProfileDialog();
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Failed to fetch profile data")),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Server error")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }
//
//   void _showProfileDialog() {
//     if (userProfile == null) return;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("User Profile"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Name: ${userProfile!['name']}"),
//               SizedBox(height: 10),
//               Text("Place: ${userProfile!['place']}"),
//               SizedBox(height: 10),
//               Text("Phone: ${userProfile!['phone']}"),
//               SizedBox(height: 10),
//               Text("Email: ${userProfile!['email']}"),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple.shade50,
//       appBar: AppBar(
//         title: const Text("Bus", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => user_profile(title: '',)),
//               );
//             },
//           ),
//         ],
//
//       ),
//       drawer: const Drawerclass(),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(color: Colors.black12, blurRadius: 10),
//                   ],
//                 ),
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildLocationRow(
//                       fromTitle: "From",
//                       fromValue: "Location 1",
//                       toTitle: "To",
//                       toValue: "Location 2",
//                       icon: Icons.location_on,
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(color: Colors.black12, blurRadius: 10),
//                   ],
//                 ),
//                 padding: EdgeInsets.all(16),
//                 // child: Column(
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     _buildInfoRow("Passenger", "01", Icons.person),
//                 //     Divider(),
//                 //     _buildInfoRow("Type", "TYPE", Icons.directions_bus),
//                 //     Divider(),
//                 //     _buildInfoRow("Depart", "Sun 3 Jun 2021", Icons.calendar_today),
//                 //   ],
//                 // ),
//               ),
//               SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 ),
//                 child: Text("SEARCH", style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.edit), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ""),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildLocationRow(String title, String value, IconData icon) {
//   //   return Row(
//   //     children: [
//   //       Icon(icon, color: Colors.purple),
//   //       SizedBox(width: 10),
//   //       Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//   //       Spacer(),
//   //       Text(value, style: TextStyle(fontSize: 16, color: Colors.purple)),
//   //     ],
//   //   );
//   // }
//   // import 'package:flutter/material.dart';
//
//   Widget _buildLocationRow({
//     required String fromTitle,
//     required String fromValue,
//     required String toTitle,
//     required String toValue,
//     required IconData icon,
//   }) {
//     return Column(
//       children: [
//         // "From" Row
//         Row(
//           children: [
//             Icon(icon, color: Colors.purple),
//             const SizedBox(width: 10),
//             Text(fromTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             const Spacer(),
//             Text(fromValue, style: const TextStyle(fontSize: 16, color: Colors.purple)),
//           ],
//         ),
//         const SizedBox(height: 10), // Spacing between "From" and "To" rows
//         // "To" Row
//         Row(
//           children: [
//             Icon(icon, color: Colors.purple),
//             const SizedBox(width: 10),
//             Text(toTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             const Spacer(),
//             Text(toValue, style: const TextStyle(fontSize: 16, color: Colors.purple)),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow(String title, String value, IconData icon) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.purple),
//         SizedBox(width: 10),
//         Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         Spacer(),
//         Text(value, style: TextStyle(fontSize: 16, color: Colors.purple)),
//       ],
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final TextEditingController _fromController = TextEditingController();
//   final TextEditingController _toController = TextEditingController();
//   List<dynamic> busRoutes = [];
//
//   Future<void> _searchBuses() async {
//     final from = _fromController.text;
//     final to = _toController.text;
//
//     if (from.isEmpty || to.isEmpty) return;
//
//     final url = Uri.parse('http://your-django-server.com/search_buses/?from=$from&to=$to');
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       setState(() {
//         busRoutes = json.decode(response.body)['routes'];
//       });
//     } else {
//       print('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Search Buses')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _fromController,
//               decoration: InputDecoration(labelText: 'From Location'),
//             ),
//             TextField(
//               controller: _toController,
//               decoration: InputDecoration(labelText: 'To Location'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _searchBuses,
//               child: Text('Search'),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: busRoutes.length,
//                 itemBuilder: (context, index) {
//                   final route = busRoutes[index];
//                   return Card(
//                     child: ListTile(
//                       title: Text('Bus: ${route['bus_name']}'),
//                       subtitle: Text(
//                           'Trip: ${route['trip_name']}\nStart: ${route['start_time']} → End: ${route['end_time']}'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//
//
//
// import 'package:project_new/Drawer.dart';
// import 'package:project_new/viewstoptime.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'package:url_launcher/url_launcher.dart';
//
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final TextEditingController _fromController = TextEditingController();
//   final TextEditingController _toController = TextEditingController();
//   List<dynamic> busRoutes = [];
//   bool isLoading = false;
//
//   Future<void> _searchBuses() async {
//     final from = _fromController.text;
//     final to = _toController.text;
//
//     if (from.isEmpty || to.isEmpty) {
//       _showSnackbar('Please enter both locations');
//       return;
//     }
//
//     setState(() => isLoading = true);
//
//     SharedPreferences sh=await SharedPreferences.getInstance();
//     String url=sh.getString('url').toString();
//     String lid=sh.getString('lid').toString();
//     final urll = Uri.parse(url+'search_buses/?from=$from&to=$to');
//
//     try {
//       final response = await http.get(urll);
//
//       if (response.statusCode == 200) {
//         setState(() {
//           busRoutes = json.decode(response.body)['routes'];
//           isLoading = false;
//         });
//         print(busRoutes);
//       } else {
//         _showSnackbar('Failed to load data');
//         setState(() => isLoading = false);
//       }
//     } catch (e) {
//       _showSnackbar('Error: $e');
//       setState(() => isLoading = false);
//     }
//   }
//
//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.red),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//         elevation: 4,
//         shadowColor: Colors.black.withOpacity(0.2),
//       ),
//       drawer: const Drawerclass(),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _buildSearchField(
//               controller: _fromController,
//               label: 'From Location',
//               icon: Icons.location_on,
//             ),
//             const SizedBox(height: 12),
//             _buildSearchField(
//               controller: _toController,
//               label: 'To Location',
//               icon: Icons.location_on_outlined,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : _searchBuses,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text(
//                 'Search',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : busRoutes.isEmpty
//                   ? const Center(child: Text('No routes found'))
//                   : _buildRouteList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSearchField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//   }) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 16),
//       ),
//     );
//   }
//
//   Widget _buildRouteList() {
//     return ListView.builder(
//       itemCount: busRoutes.length,
//       itemBuilder: (context, index) {
//         final route = busRoutes[index];
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           elevation: 3,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: ListTile(
//             leading: const CircleAvatar(
//               backgroundColor: Colors.blueAccent,
//               child: Icon(Icons.directions_bus, color: Colors.white),
//             ),
//             title: Text(
//               route['bus_name'],
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               'Trip: ${route['trip_name']}\n'
//                   'Start: ${route['start_time']} → End: ${route['end_time']}',
//               style: TextStyle(color: Colors.grey[600]),
//             ),
//             trailing:
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.end,
//             //   children: [
//             //     ElevatedButton(
//             //       onPressed: () async {
//             //         String tid = route['id'].toString();
//             //         final prefs = await SharedPreferences.getInstance();
//             //         prefs.setString("tid", tid);
//             //         Navigator.push(
//             //           context,
//             //           MaterialPageRoute(
//             //               builder: (context) => viewstoptime()),
//             //         );
//             //         // ScaffoldMessenger.of(context).showSnackBar(
//             //         //   SnackBar(content: Text("Bus ${bus['bus_name']}")),
//             //         // );
//             //       },
//             //       child: const Text("More"),
//             //     ),
//             //     SizedBox(width: 10,),
//             //     if(route['loc'] != "Na")
//             //       ElevatedButton(
//             //         onPressed: () async {
//             //           await launchUrl(Uri.parse(route['loc']), mode: LaunchMode.externalApplication); // Opens in an external browser
//             //
//             //         },
//             //         child: const Text("Track"),
//             //       ),
//             //
//             //   ],
//             // ),
//             const Icon(Icons.location_pin, color: Colors.blueAccent),
//             onTap: () async {
//               final sh = await SharedPreferences.getInstance();
//               String url = sh.getString("url").toString();
//               url+="live_loc1?bid="+route['bid'].toString();
//               print(route['loc']);
//               await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication); // Opens in an external browser
//               //
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   void _showRouteDetails(Map<String, dynamic> route) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 route['bus_name'],
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text('Trip: ${route['trip_name']}'),
//               const SizedBox(height: 4),
//               Text('Start Time: ${route['start_time']}'),
//               Text('End Time: ${route['end_time']}'),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text('Close'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:project_new/Drawer.dart';
import 'package:project_new/viewstoptime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  List<dynamic> busRoutes = [];
  bool isLoading = false;
  List<String> allStops = [];
  List<String> fromSuggestions = [];
  List<String> toSuggestions = [];
  FocusNode _fromFocusNode = FocusNode();
  FocusNode _toFocusNode = FocusNode();
  bool _isLoadingStops = false;

  @override
  void initState() {
    super.initState();
    _loadAllStops();
    _fromFocusNode.addListener(_onFromFocusChange);
    _toFocusNode.addListener(_onToFocusChange);
  }

  void _onFromFocusChange() {
    if (!_fromFocusNode.hasFocus) {
      setState(() => fromSuggestions = []);
    }
  }

  void _onToFocusChange() {
    if (!_toFocusNode.hasFocus) {
      setState(() => toSuggestions = []);
    }
  }

  Future<void> _loadAllStops() async {
    setState(() => _isLoadingStops = true);
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String url = sh.getString('url').toString();
      final response = await http.get(Uri.parse('$url/get_all_stops/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          allStops = List<String>.from(data['stops']);
          _isLoadingStops = false;
        });
      } else {
        setState(() => _isLoadingStops = false);
        _showSnackbar('Failed to load stops: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _isLoadingStops = false);
      _showSnackbar('Error loading stops: $e');
    }
  }

  void _updateFromSuggestions(String query) {
    setState(() {
      fromSuggestions = allStops
          .where((stop) => stop.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _updateToSuggestions(String query) {
    setState(() {
      toSuggestions = allStops
          .where((stop) => stop.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _searchBuses() async {
    final from = _fromController.text;
    final to = _toController.text;

    if (from.isEmpty || to.isEmpty) {
      _showSnackbar('Please select both locations');
      return;
    }

    setState(() {
      isLoading = true;
      fromSuggestions = [];
      toSuggestions = [];
    });

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    final urll = Uri.parse('${url}search_buses/?from=$from&to=$to');

    try {
      final response = await http.get(urll);

      if (response.statusCode == 200) {
        setState(() {
          busRoutes = json.decode(response.body)['routes'];
          isLoading = false;
        });
      } else {
        _showSnackbar('Failed to load data');
        setState(() => isLoading = false);
      }
    } catch (e) {
      _showSnackbar('Error: $e');
      setState(() => isLoading = false);
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildAutocompleteField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required List<String> suggestions,
    required FocusNode focusNode,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
          onChanged: onChanged,
        ),
        if (suggestions.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suggestions[index]),
                    dense: true,
                    onTap: () {
                      controller.text = suggestions[index];
                      setState(() {
                        if (controller == _fromController) {
                          fromSuggestions = [];
                        } else {
                          toSuggestions = [];
                        }
                      });
                      focusNode.unfocus();
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRouteList() {
    return ListView.builder(
      itemCount: busRoutes.length,
      itemBuilder: (context, index) {
        final route = busRoutes[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.directions_bus, color: Colors.white),
            ),
            title: Text(
              route['bus_name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Trip: ${route['trip_name']}\n'
                  'Start: ${route['start_time']} → End: ${route['end_time']}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Icon(Icons.location_pin, color: Colors.blueAccent),
            onTap: () async {
              final sh = await SharedPreferences.getInstance();
              String url = sh.getString("url").toString();
              url += "live_loc1?bid=" + route['bid'].toString();
              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      drawer: Drawerclass(),
      body: _isLoadingStops
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAutocompleteField(
              controller: _fromController,
              label: 'From Location',
              icon: Icons.location_on,
              suggestions: fromSuggestions,
              focusNode: _fromFocusNode,
              onChanged: _updateFromSuggestions,
            ),
            SizedBox(height: 12),
            _buildAutocompleteField(
              controller: _toController,
              label: 'To Location',
              icon: Icons.location_on_outlined,
              suggestions: toSuggestions,
              focusNode: _toFocusNode,
              onChanged: _updateToSuggestions,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _searchBuses,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                'Search',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : busRoutes.isEmpty
                  ? Center(child: Text('No routes found'))
                  : _buildRouteList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _fromFocusNode.dispose();
    _toFocusNode.dispose();
    super.dispose();
  }
}
