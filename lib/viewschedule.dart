//
//
// import 'package:flutter/material.dart';
// import 'package:project_new/viewstoptime.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class viewshedule extends StatefulWidget {
//   const viewshedule({super.key});
//
//   @override
//   State<viewshedule> createState() => _viewsheduleState();
// }
//
// class _viewsheduleState extends State<viewshedule> {
//   List<dynamic> buses = []; // To store bus data
//   bool isLoading = true; // To manage loading state
//
//   @override
//   void initState() {
//     super.initState();
//     fetchBuses();
//   }
//
//   Future<void> fetchBuses() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       String rid = prefs.getString("rid") ?? "1"; // Defaulting to 1 if null
//       String ip = prefs.getString("url") ?? ""; // Ensure `url` is stored in SharedPreferences
//
//       String url = "$ip/view_bus";
//       var response = await http.post(Uri.parse(url), body: {
//         'rid': rid,
//       });
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         if (jsonData['status'] == "ok") {
//           setState(() {
//             buses = jsonData['data'];
//             isLoading = false;
//           });
//         } else {
//           showError("Failed to fetch buses.");
//         }
//       } else {
//         showError("Server error. Please try again.");
//       }
//     } catch (e) {
//       showError("Error: $e");
//     }
//   }
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("View Buses"),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : buses.isEmpty
//           ? const Center(child: Text("No buses found."))
//           : ListView.builder(
//         itemCount: buses.length,
//         itemBuilder: (context, index) {
//           var bus = buses[index];
//           return Card(
//             margin: const EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ListTile(
//                     title: Text("Bus Name: ${bus['bus_name']}"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Bus No: ${bus['bus_no']}"),
//                         Text("Start Time: ${bus['start time']}"),
//                         Text("End Time: ${bus['end time']}"),
//                         Text(
//                           "Status: ${bus['status']}",
//                           style: TextStyle(
//                               color: bus['status'] == "Delayed"
//                                   ? Colors.red
//                                   : Colors.green,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: ElevatedButton(
//                       onPressed: ()   async  {
//                         String tid= buses[index].toString();
//
//
//                         final prefs = await SharedPreferences.getInstance();
//                         prefs.setString("tid",tid); // Defaulting to 1 if null
//                         Navigator.push(context,
//                             MaterialPageRoute(
//                                 builder: (context) => viewstoptime()));
//                         // Handle button action here
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Bus ${bus['bus_name']} ")),
//                         );
//                       },
//                       child: const Text("More"),
//                     ),
//
//                   ),
//                 ],
//               ),
//             ),
//           );
//     },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:project_new/viewstoptime.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class viewshedule extends StatefulWidget {
//   const viewshedule({super.key});
//
//   @override
//   State<viewshedule> createState() => _viewsheduleState();
// }
//
// class _viewsheduleState extends State<viewshedule> {
//   List<dynamic> buses = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchBuses();
//   }
//
//   Future<void> fetchBuses() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       String rid = prefs.getString("rid") ?? "1";
//       String ip = prefs.getString("url") ?? "";
//
//       String url = "$ip/view_bus";
//       var response = await http.post(Uri.parse(url), body: {
//         'rid': rid,
//       });
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         if (jsonData['status'] == "ok") {
//           setState(() {
//             buses = jsonData['data'];
//             isLoading = false;
//           });
//         } else {
//           showError("Failed to fetch buses.");
//         }
//       } else {
//         showError("Server error. Please try again.");
//       }
//     } catch (e) {
//       showError("Error: $e");
//     }
//   }
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("View Buses"),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : buses.isEmpty
//           ? const Center(child: Text("No buses found."))
//           : ListView.builder(
//         itemCount: buses.length,
//         itemBuilder: (context, index) {
//           var bus = buses[index];
//           return Card(
//             margin: const EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ListTile(
//                     title: Text("Bus Name: ${bus['bus_name']}"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Bus No: ${bus['bus_no']}"),
//                         Text("Start Time: ${bus['start time']}"),
//                         Text("End Time: ${bus['end time']}"),
//                         Text(
//                           "Status: ${bus['status']}",
//                           style: TextStyle(
//                               color: bus['status'] == "Delayed"
//                                   ? Colors.red
//                                   : Colors.green,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           String tid = buses[index].toString();
//                           final prefs = await SharedPreferences.getInstance();
//                           prefs.setString("tid", tid);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => viewstoptime()),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Bus ${bus['bus_name']}")),
//                           );
//                         },
//                         child: const Text("More"),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Add Collection for Bus ${bus['bus_name']}")),
//                           );
//                         },
//                         child: const Text("Add Collection"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:project_new/viewstoptime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class viewshedule extends StatefulWidget {
  const viewshedule({super.key});

  @override
  State<viewshedule> createState() => _viewsheduleState();
}

class _viewsheduleState extends State<viewshedule> {
  List<dynamic> buses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBuses();
  }

  Future<void> fetchBuses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String rid = prefs.getString("rid") ?? "1";
      String ip = prefs.getString("url") ?? "";

      String url = "$ip/view_bus1";
      var response = await http.post(Uri.parse(url), body: {
        'rid': rid,
      });

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == "ok") {
          setState(() {
            buses = jsonData['data'];
            isLoading = false;
          });
        } else {
          showError("Failed to fetch buses.");
        }
      } else {
        showError("Server error. Please try again.");
      }
    } catch (e) {
      showError("Error: $e");
    }
  }

  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Buses"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : buses.isEmpty
          ? const Center(child: Text("No buses found."))
          : ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          var bus = buses[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Bus Name: ${bus['bus_name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bus No: ${bus['bus_no']}"),
                        Text("Start Time: ${bus['start time']}"),
                        Text("End Time: ${bus['end time']}"),
                        Text(
                          "Status: ${bus['status']}",
                          style: TextStyle(
                              color: bus['status'] == "Delayed"
                                  ? Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          String tid = buses[index].toString();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString("tid", tid);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => viewstoptime()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Bus ${bus['bus_name']}")),
                          );
                        },
                        child: const Text("More"),
                      ),
                        SizedBox(width: 10,),
                        if(bus['loc'] != "Na")
                        ElevatedButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(bus['loc']), mode: LaunchMode.externalApplication); // Opens in an external browser

                        },
                        child: const Text("Track"),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}