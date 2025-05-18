// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UpdateStopTimeScreen extends StatefulWidget {
//   @override
//   _UpdateStopTimeScreenState createState() => _UpdateStopTimeScreenState();
// }
//
// class _UpdateStopTimeScreenState extends State<UpdateStopTimeScreen> {
//   List<String> stops = []; // List to store fetched stop names
//   String? selectedStop; // Selected stop from dropdown
//   final TextEditingController _arrivalTimeController = TextEditingController();
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchStops(); // Fetch stop names when the screen loads
//   }
//
//   Future<void> fetchStops() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? url = prefs.getString("url");
//
//     if (url == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: Missing server URL")),
//       );
//       return;
//     }
//
//     try {
//       var response = await http.get(Uri.parse("${url}get_stops"));
//       var jsonData = json.decode(response.body);
//
//       if (jsonData['status'] == 'ok') {
//         setState(() {
//           stops = List<String>.from(jsonData['stops']);
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error: ${jsonData['message']}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Network error: $e")),
//       );
//     }
//   }
//
//   Future<void> updateStopTime() async {
//     if (selectedStop == null || _arrivalTimeController.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please select a stop and enter arrival time")),
//       );
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     final prefs = await SharedPreferences.getInstance();
//     String? url = prefs.getString("url");
//     String? lid = prefs.getString("lid");
//
//     if (url == null || lid == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: Missing user credentials")),
//       );
//       setState(() {
//         isLoading = false;
//       });
//       return;
//     }
//
//     try {
//       var response = await http.post(
//         Uri.parse("${url}update_stop_time"),
//         body: {
//           'lid': lid,
//           'stop_name': selectedStop,
//           'arrival_time': _arrivalTimeController.text.trim(),
//         },
//       );
//
//       var jsonData = json.decode(response.body);
//       if (jsonData['status'] == 'ok') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Stop time updated successfully!")),
//         );
//         _arrivalTimeController.clear();
//         setState(() {
//           selectedStop = null; // Reset dropdown selection
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error: ${jsonData['message']}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Network error: $e")),
//       );
//     }
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update Stop Time")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Select Stop & Enter Arrival Time",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               value: selectedStop,
//               hint: Text("Select Stop"),
//               items: stops.map((stop) {
//                 return DropdownMenuItem<String>(
//                   value: stop,
//                   child: Text(stop),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedStop = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _arrivalTimeController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Arrival Time",
//                 hintText: "Enter arrival time (HH:MM)",
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: isLoading ? null : updateStopTime,
//               child: isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text("Update Stop Time"),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
