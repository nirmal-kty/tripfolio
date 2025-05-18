// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class viewstoptime extends StatefulWidget {
//   const viewstoptime({super.key});
//
//   @override
//   State<viewstoptime> createState() => _viewstoptimeState();
// }
//
// class _viewstoptimeState extends State<viewstoptime> {
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
//       String url = "$ip/view_stoptime";
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
//         title: const Text("View Stoptime"),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : buses.isEmpty
//           ? const Center(child: Text("No schedules."))
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
//                     // title: Text("Bus Name: ${bus['bus_name']}"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("stop: ${bus['stop']}"),
//                         Text("stoptime: ${bus['stoptime']}"),
//
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   // Align(
//                   //   alignment: Alignment.centerRight,
//                   //   child: ElevatedButton(
//                   //     onPressed: ()   async  {
//                   //       String tid= buses[index].toString();
//                   //
//                   //
//                   //       final prefs = await SharedPreferences.getInstance();
//                   //       prefs.setString("tid",tid); // Defaulting to 1 if null
//                   //       // Navigator.push(context,
//                   //       //     MaterialPageRoute(
//                   //       //         builder: (context) => ()));
//                   //       // Handle button action here
//                   //       ScaffoldMessenger.of(context).showSnackBar(
//                   //         // SnackBar(content: Text("Bus ${bus['bus_name']} selected")),
//                   //       );
//                   //     },
//                   //     // child: const Text("More"),
//                   //   ),
//                   // ),
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
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class viewstoptime extends StatefulWidget {
  const viewstoptime({super.key});

  @override
  State<viewstoptime> createState() => _viewstoptimeState();
}

class _viewstoptimeState extends State<viewstoptime> {
  List<dynamic> buses = []; // To store bus data
  bool isLoading = true; // To manage loading state

  @override
  void initState() {
    super.initState();
    fetchBuses();
  }

  Future<void> fetchBuses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String rid = prefs.getString("tid") ?? "1"; // Defaulting to 1 if null
      String ip = prefs.getString("url") ?? ""; // Ensure `url` is stored in SharedPreferences

      String url = "$ip/view_stoptime";
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
        title: const Text("View Stop Times", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : buses.isEmpty
          ? const Center(child: Text("No schedules found."))
          : ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          var bus = buses[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.schedule, color: Colors.blue),
                      title: Text("Stop: ${bus['stop']}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Stop Time: ${bus['stoptime']}",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
