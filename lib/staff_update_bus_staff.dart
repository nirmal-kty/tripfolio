// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(BusStatusApp());
// }
//
// class BusStatusApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Update Bus Status',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: UpdateBusStatusScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class UpdateBusStatusScreen extends StatefulWidget {
//   @override
//   _UpdateBusStatusScreenState createState() => _UpdateBusStatusScreenState();
// }
//
// class _UpdateBusStatusScreenState extends State<UpdateBusStatusScreen> {
//   final TextEditingController _statusController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> updateBusStatus() async {
//     String status = _statusController.text.trim();
//
//     if (status.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter a status")),
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
//         Uri.parse("${url}update_bus_status"),
//         body: {
//           'lid': lid,
//           'status': status,
//         },
//       );
//
//       var jsonData = json.decode(response.body);
//       if (jsonData['status'] == 'ok') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Bus status updated successfully!")),
//         );
//         _statusController.clear();
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
//       appBar: AppBar(title: Text("Update Bus Status")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Enter Bus Status",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _statusController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Status",
//                 hintText: "Enter status (e.g., Delayed, On Route)",
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: isLoading ? null : updateBusStatus,
//               child: isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text("Update Status"),
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



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(BusStatusApp());
}

class BusStatusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Bus Status',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UpdateBusStatusScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UpdateBusStatusScreen extends StatefulWidget {
  @override
  _UpdateBusStatusScreenState createState() => _UpdateBusStatusScreenState();
}

class _UpdateBusStatusScreenState extends State<UpdateBusStatusScreen> {
  final TextEditingController _statusController = TextEditingController();
  bool isLoading = false;

  Future<void> updateBusStatus() async {
    String status = _statusController.text.trim();

    if (status.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a status")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    String? url = prefs.getString("url");
    String? lid = prefs.getString("lid");

    if (url == null || lid == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Missing user credentials")),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      var response = await http.post(
        Uri.parse("${url}update_bus_status"),
        body: {
          'lid': lid,
          'status': status,
        },
      );

      var jsonData = json.decode(response.body);
      if (jsonData['status'] == 'ok') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bus status updated successfully!")),
        );
        _statusController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${jsonData['message']}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network error: $e")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Bus Status", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.directions_bus, size: 50, color: Colors.blue),
                    const SizedBox(height: 20),
                    const Text(
                      "Update Bus Status",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _statusController,
                      decoration: InputDecoration(
                        labelText: "Status",
                        hintText: "Enter status (e.g., Delayed, Cancelled)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        prefixIcon: Icon(Icons.info_outline, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : updateBusStatus,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                          "Update Status",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}