// import 'package:flutter/material.dart';
// import 'package:project_new/drawerstaff.dart'; // Import the staff drawer
// import 'package:project_new/staff_update_bus_staff.dart'; // Import the update bus status screen
// import 'package:project_new/view%20bus.dart'; // Import the view bus schedule screen
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'staffprofile.dart'; // Import the staff profile page
//
// class staff_home extends StatefulWidget {
//   const staff_home({Key? key}) : super(key: key);
//
//   @override
//   State<staff_home> createState() => _staff_homeState();
// }
//
// class _staff_homeState extends State<staff_home> {
//   Map<String, dynamic>? staffProfile; // To store staff profile data
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchStaffProfile(); // Fetch staff profile data when the page loads
//   }
//
//   Future<void> _fetchStaffProfile() async {
//     final sh = await SharedPreferences.getInstance();
//     String url = sh.getString("url").toString();
//     String lid = sh.getString("lid").toString();
//
//     try {
//       var response = await http.post(
//         Uri.parse("$url/staff_viewprofile/"), // Endpoint for staff profile
//         body: {"lid": lid},
//       );
//
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             staffProfile = data; // Update the state with staff profile data
//           });
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple.shade50,
//       appBar: AppBar(
//         title: const Text("Staff Home", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => staffprofile(title: 'Staff Profile')),
//               );
//             },
//           ),
//         ],
//       ),
//       drawer: const drawerstaff(), // Use the staff drawer
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (staffProfile != null) ...[
//                 Text(
//                   "Welcome, ${staffProfile!['name']}!",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 _buildProfileInfo("Role", staffProfile!['role'], Icons.work),
//                 SizedBox(height: 10),
//                 _buildProfileInfo("Bus", staffProfile!['busname'], Icons.directions_bus),
//                 SizedBox(height: 20),
//               ],
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => UpdateBusStatusScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 ),
//                 child: Text("UPDATE BUS STATUS", style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ViewBusUser()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 ),
//                 child: Text("VIEW SCHEDULE", style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileInfo(String label, String value, IconData icon) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.purple),
//         SizedBox(width: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             Text(
//               value,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:project_new/drawerstaff.dart'; // Import the staff drawer
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'staffprofile.dart'; // Import the staff profile page
//
// class staff_home extends StatefulWidget {
//   const staff_home({Key? key}) : super(key: key);
//
//   @override
//   State<staff_home> createState() => _staff_homeState();
// }
//
// class _staff_homeState extends State<staff_home> {
//   Map<String, dynamic>? staffProfile; // To store staff profile data
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchStaffProfile(); // Fetch staff profile data when the page loads
//   }
//
//   Future<void> _fetchStaffProfile() async {
//     final sh = await SharedPreferences.getInstance();
//     String url = sh.getString("url").toString();
//     String lid = sh.getString("lid").toString();
//
//     try {
//       var response = await http.post(
//         Uri.parse("$url/staff_viewprofile"), // Endpoint for staff profile
//         body: {"lid": lid},
//       );
//
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             staffProfile = data; // Update the state with staff profile data
//           });
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple.shade50,
//       appBar: AppBar(
//         title: const Text("Staff Home", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => StaffProfile(title: 'Staff Profile')),
//               );
//             },
//           ),
//         ],
//       ),
//       drawer: const drawerstaff(), // Use the staff drawer
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (staffProfile != null) ...[
//                 Text(
//                   "Welcome, ${staffProfile!['name']}!",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 _buildProfileInfo("Role", staffProfile!['role'], Icons.work),
//                 SizedBox(height: 10),
//                 _buildProfileInfo("Bus", staffProfile!['busname'], Icons.directions_bus),
//                 SizedBox(height: 20),
//               ],
//               // Removed "UPDATE BUS STATUS" and "VIEW SCHEDULE" buttons
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileInfo(String label, String value, IconData icon) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.purple),
//         SizedBox(width: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             Text(
//               value,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project_new/drawerstaff.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'staffprofile.dart';
import 'package:project_new/login.dart'; // Make sure this import exists

class staff_home extends StatefulWidget {
  const staff_home({Key? key}) : super(key: key);

  @override
  State<staff_home> createState() => _staff_homeState();
}

class _staff_homeState extends State<staff_home> {
  Map<String, dynamic>? staffProfile;
  String? profileImage;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchStaffProfile();
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
    _fetchStaffProfile();
  }

  Future<void> _checkAuth() async {
    final sh = await SharedPreferences.getInstance();
    if (sh.getString("lid") == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const login()),
            (Route<dynamic> route) => false,
      );
    }
  }




  Future<void> _fetchStaffProfile() async {
    final sh = await SharedPreferences.getInstance();
    String url = sh.getString("url").toString();
    String lid = sh.getString("lid").toString();

    try {
      var response = await http.post(
        Uri.parse("$url/staff_viewprofile"),
        body: {"lid": lid},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'ok') {
          setState(() {
            staffProfile = data;
            profileImage = data['image'];
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to fetch profile data")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server error")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Staff Home",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StaffProfile(title: 'Staff Profile')),
              );
            },
          ),
        ],
      ),
      drawer: const drawerstaff(),
      body: SafeArea(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (staffProfile != null) ...[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                        color: Colors.blue.shade50,
                      ),
                      child: profileImage != null && profileImage!.isNotEmpty
                          ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: profileImage!,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(color: Colors.blue),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.person, size: 50, color: Colors.blue),
                          fit: BoxFit.cover,
                        ),
                      )
                          : Icon(Icons.person, size: 50, color: Colors.blue),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome, ${staffProfile!['name']}!",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildProfileInfo("Role", staffProfile!['role'], Icons.work),
                    const SizedBox(height: 20),
                    _buildProfileInfo("Bus", staffProfile!['busname'], Icons.directions_bus),
                    const SizedBox(height: 30),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.blue.shade800),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}