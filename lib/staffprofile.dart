// // import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'staff_home.dart'; // Import the staff home page
// //
// // class staffprofile extends StatefulWidget {
// //   const staffprofile({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   State<staffprofile> createState() => _staffprofileState();
// // }
// //
// // class _staffprofileState extends State<staffprofile> {
// //   String name_ = 'name';
// //   String email_ = 'email';
// //   String phone_ = 'phone';
// //   String role_ = 'role';
// //   String busname_ = 'busname';
// //   String? image_;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     senddata(); // Fetch staff profile data when the page loads
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () async {
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
// //         return false;
// //       },
// //       child: Scaffold(
// //         backgroundColor: Colors.grey.shade300,
// //         body: SingleChildScrollView(
// //           child: Stack(
// //             children: [
// //               Container(
// //                 margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
// //                 child: InkWell(
// //                   onTap: () {
// //                     // Handle image tap
// //                   },
// //                   child: Column(
// //                     children: [
// //                       Stack(
// //                         children: [
// //                           Container(
// //                             padding: EdgeInsets.all(16.0),
// //                             margin: EdgeInsets.only(top: 16.0),
// //                             decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               borderRadius: BorderRadius.circular(20.0),
// //                             ),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Container(
// //                                   margin: const EdgeInsets.only(left: 110.0),
// //                                   child: Row(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       Column(
// //                                         crossAxisAlignment: CrossAxisAlignment.start,
// //                                         mainAxisAlignment: MainAxisAlignment.start,
// //                                         children: [
// //                                           Text(
// //                                             name_,
// //                                             style: Theme.of(context).textTheme.headline6,
// //                                           ),
// //                                           SizedBox(height: 40),
// //                                         ],
// //                                       ),
// //                                       Spacer(),
// //                                       CircleAvatar(
// //                                         backgroundColor: Colors.blueAccent,
// //                                         child: IconButton(
// //                                           onPressed: () {
// //                                             Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
// //                                           },
// //                                           icon: Icon(
// //                                             Icons.edit_outlined,
// //                                             color: Colors.white,
// //                                             size: 18,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 20.0),
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(20.0),
// //                         ),
// //                         child: Column(
// //                           children: [
// //                             ListTile(
// //                               title: Text("Profile Information"),
// //                             ),
// //                             Divider(),
// //                             ListTile(
// //                               title: Text('Role'),
// //                               subtitle: Text(role_),
// //                               leading: Icon(Icons.work),
// //                             ),
// //                             Divider(),
// //                             ListTile(
// //                               title: Text('Bus'),
// //                               subtitle: Text(busname_),
// //                               leading: Icon(Icons.directions_bus),
// //                             ),
// //                             Divider(),
// //                             ListTile(
// //                               title: Text('Email'),
// //                               subtitle: Text(email_),
// //                               leading: Icon(Icons.mail_outline),
// //                             ),
// //                             ListTile(
// //                               title: Text("Phone"),
// //                               subtitle: Text(phone_),
// //                               leading: Icon(Icons.phone),
// //                             ),
// //                             SizedBox(height: 10),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 60,
// //                 left: 20,
// //                 child: MaterialButton(
// //                   minWidth: 0.2,
// //                   elevation: 0.2,
// //                   color: Colors.white,
// //                   child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.indigo),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(30.0),
// //                   ),
// //                   onPressed: () {
// //                     Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void senddata() async {
// //     SharedPreferences sh = await SharedPreferences.getInstance();
// //     String url = sh.getString('url').toString();
// //     String lid = sh.getString('lid').toString();
// //     final urls = Uri.parse("$url/staff_viewprofile");
// //
// //     try {
// //       final response = await http.post(urls, body: {'lid': lid});
// //       if (response.statusCode == 200) {
// //         String status = jsonDecode(response.body)['status'];
// //         if (status == 'ok') {
// //           setState(() {
// //             email_ = jsonDecode(response.body)['email'].toString();
// //             name_ = jsonDecode(response.body)['name'].toString();
// //             phone_ = jsonDecode(response.body)['phone'].toString();
// //             role_ = jsonDecode(response.body)['role'].toString();
// //             busname_ = jsonDecode(response.body)['busname'].toString();
// //             image_ = jsonDecode(response.body)['image'];
// //           });
// //         } else {
// //           Fluttertoast.showToast(msg: 'Not Found');
// //         }
// //       } else {
// //         Fluttertoast.showToast(msg: 'Network Error');
// //       }
// //     } catch (e) {
// //       Fluttertoast.showToast(msg: e.toString());
// //     }
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'staff_home.dart'; // Import the staff home page
//
// class staffprofile extends StatefulWidget {
//   const staffprofile({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<staffprofile> createState() => _staffprofileState();
// }
//
// class _staffprofileState extends State<staffprofile> {
//   String name_ = 'name';
//   String email_ = 'email';
//   String phone_ = 'phone';
//   String role_ = 'role';
//   String busname_ = 'busname';
//   String? image_;
//
//   @override
//   void initState() {
//     super.initState();
//     senddata(); // Fetch staff profile data when the page loads
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade300,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
//                 child: InkWell(
//                   onTap: () {
//                     // Handle image tap
//                   },
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16.0),
//                             margin: EdgeInsets.only(top: 16.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.only(left: 110.0),
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             name_,
//                                             style: Theme.of(context).textTheme.headline6,
//                                           ),
//                                           SizedBox(height: 40),
//                                         ],
//                                       ),
//                                       Spacer(),
//                                       CircleAvatar(
//                                         backgroundColor: Colors.blueAccent,
//                                         child: IconButton(
//                                           onPressed: () {
//                                             Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                                           },
//                                           icon: Icon(
//                                             Icons.edit_outlined,
//                                             color: Colors.white,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text("Profile Information"),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Role'),
//                               subtitle: Text(role_),
//                               leading: Icon(Icons.work),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Bus'),
//                               subtitle: Text(busname_),
//                               leading: Icon(Icons.directions_bus),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Email'),
//                               subtitle: Text(email_),
//                               leading: Icon(Icons.mail_outline),
//                             ),
//                             ListTile(
//                               title: Text("Phone"),
//                               subtitle: Text(phone_),
//                               leading: Icon(Icons.phone),
//                             ),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 left: 20,
//                 child: MaterialButton(
//                   minWidth: 0.2,
//                   elevation: 0.2,
//                   color: Colors.white,
//                   child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.indigo),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void senddata() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     final urls = Uri.parse("$url/staff_viewprofile");
//
//     print("URL: $urls"); // Debugging: Print the URL
//     print("LID: $lid");  // Debugging: Print the LID
//
//     try {
//       final response = await http.post(urls, body: {'lid': lid});
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             email_ = data['email'].toString();
//             name_ = data['name'].toString();
//             phone_ = data['phone'].toString();
//             role_ = data['role'].toString();
//             busname_ = data['busname'].toString();
//             image_ = data['image'];
//           });
//         } else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'staff_home.dart'; // Import the staff home page
//
// class staffprofile extends StatefulWidget {
//   const staffprofile({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<staffprofile> createState() => _staffprofileState();
// }
//
// class _staffprofileState extends State<staffprofile> {
//   String name_ = 'name';
//   String email_ = 'email';
//   String phone_ = 'phone';
//   String role_ = 'role';
//   String busname_ = 'busname';
//   String? image_;
//
//   @override
//   void initState() {
//     super.initState();
//     senddata(); // Fetch staff profile data when the page loads
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade300,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
//                 child: InkWell(
//                   onTap: () {
//                     // Handle image tap
//                   },
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16.0),
//                             margin: EdgeInsets.only(top: 16.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.only(left: 110.0),
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             name_,
//                                             style: Theme.of(context).textTheme.headline6,
//                                           ),
//                                           SizedBox(height: 40),
//                                         ],
//                                       ),
//                                       Spacer(),
//                                       CircleAvatar(
//                                         backgroundColor: Colors.blueAccent,
//                                         child: IconButton(
//                                           onPressed: () {
//                                             Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                                           },
//                                           icon: Icon(
//                                             Icons.edit_outlined,
//                                             color: Colors.white,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text("Profile Information"),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Role'),
//                               subtitle: Text(role_),
//                               leading: Icon(Icons.work),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Bus'),
//                               subtitle: Text(busname_),
//                               leading: Icon(Icons.directions_bus),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Email'),
//                               subtitle: Text(email_),
//                               leading: Icon(Icons.mail_outline),
//                             ),
//                             ListTile(
//                               title: Text("Phone"),
//                               subtitle: Text(phone_),
//                               leading: Icon(Icons.phone),
//                             ),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 left: 20,
//                 child: MaterialButton(
//                   minWidth: 0.2,
//                   elevation: 0.2,
//                   color: Colors.white,
//                   child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.indigo),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void senddata() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     final urls=Uri.parse(url+"/staff_viewprofile");
//
//     print("URL: $urls"); // Debugging: Print the URL
//     print("LID: $lid");  // Debugging: Print the LID
//
//     try {
//       final response = await http.post(urls, body: {'lid': lid});
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             email_ = data['email'].toString();
//             name_ = data['name'].toString();
//             phone_ = data['phone'].toString();
//             role_ = data['role'].toString();
//             busname_ = data['busname'].toString();
//             image_ = data['image'];
//           });
//         } else {
//           Fluttertoast.showToast(msg: 'Failed to fetch profile data');
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Server error: ${response.statusCode}');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Error: $e');
//     }
//   }
// }



//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'staff_home.dart'; // Import the staff home page
//
// class StaffProfile extends StatefulWidget {
//   const StaffProfile({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<StaffProfile> createState() => _StaffProfileState();
// }
//
// class _StaffProfileState extends State<StaffProfile> {
//   String name_ = 'name';
//   String email_ = 'email';
//   String phone_ = 'phone';
//   String role_ = 'role';
//   String busname_ = 'busname';
//   String? image_;
//
//   @override
//   void initState() {
//     super.initState();
//     sendData(); // Fetch staff profile data when the page loads
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade300,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
//                 child: InkWell(
//                   onTap: () {
//                     // Handle image tap
//                   },
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16.0),
//                             margin: EdgeInsets.only(top: 16.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if (image_ != null)
//                                   Center(
//                                     child: CircleAvatar(
//                                       radius: 50,
//                                       backgroundImage: NetworkImage(image_!),
//                                       onBackgroundImageError: (error, stackTrace) {
//                                         print("Failed to load image: $error");
//                                       },
//                                     ),
//                                   ),
//                                 Container(
//                                   margin: const EdgeInsets.only(left: 110.0),
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             name_,
//                                             style: Theme.of(context).textTheme.headline6,
//                                           ),
//                                           SizedBox(height: 40),
//                                         ],
//                                       ),
//                                       Spacer(),
//                                       // CircleAvatar(
//                                       //   backgroundColor: Colors.blueAccent,
//                                       //   child: IconButton(
//                                       //     onPressed: () {
//                                       //       Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                                       //     },
//                                       //     icon: Icon(
//                                       //       Icons.edit_outlined,
//                                       //       color: Colors.white,
//                                       //       size: 18,
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text("Profile Information"),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Role'),
//                               subtitle: Text(role_),
//                               leading: Icon(Icons.work),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Bus'),
//                               subtitle: Text(busname_),
//                               leading: Icon(Icons.directions_bus),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text('Email'),
//                               subtitle: Text(email_),
//                               leading: Icon(Icons.mail_outline),
//                             ),
//                             ListTile(
//                               title: Text("Phone"),
//                               subtitle: Text(phone_),
//                               leading: Icon(Icons.phone),
//                             ),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 left: 20,
//                 child: MaterialButton(
//                   minWidth: 0.2,
//                   elevation: 0.2,
//                   color: Colors.white,
//                   child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.indigo),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => staff_home()));
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void sendData() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     final urls = Uri.parse(url + "/staff_viewprofile");
//
//     print("URL: $urls"); // Debugging: Print the URL
//     print("LID: $lid");  // Debugging: Print the LID
//
//     try {
//       final response = await http.post(urls, body: {'lid': lid});
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 'ok') {
//           setState(() {
//             email_ = data['email'].toString();
//             name_ = data['name'].toString();
//             phone_ = data['phone'].toString();
//             role_ = data['role'].toString();
//             busname_ = data['busname'].toString();
//             image_ = data['image'];
//           });
//
//           // Debugging: Check if the image URL is accessible
//           if (image_ != null) {
//             final imageResponse = await http.get(Uri.parse(image_!));
//             if (imageResponse.statusCode == 200) {
//               print("Image is accessible");
//             } else {
//               print("Failed to load image: ${imageResponse.statusCode}");
//             }
//           }
//         } else {
//           Fluttertoast.showToast(msg: 'Failed to fetch profile data');
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Server error: ${response.statusCode}');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Error: $e');
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'staff_home.dart';

class StaffProfile extends StatefulWidget {
  const StaffProfile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StaffProfile> createState() => _StaffProfileState();
}

class _StaffProfileState extends State<StaffProfile> {
  String name_ = 'name';
  String email_ = 'email';
  String phone_ = 'phone';
  String role_ = 'role';
  String busname_ = 'busname';
  String? image_;

  @override
  void initState() {
    super.initState();
    sendData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => staff_home())
          ),
        ),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 2),
                    color: Colors.blue.shade50,
                  ),
                  child: image_ != null && image_!.isNotEmpty
                      ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: image_!,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(color: Colors.blue),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.person, size: 50, color: Colors.blue),
                      fit: BoxFit.cover,
                    ),
                  )
                      : Icon(Icons.person, size: 50, color: Colors.blue),
                ),
                SizedBox(height: 20),
                Text(
                  name_,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),
                ),
                SizedBox(height: 30),
                _buildProfileInfo("Role", role_, Icons.work),
                SizedBox(height: 16),
                _buildProfileInfo("Bus", busname_, Icons.directions_bus),
                SizedBox(height: 16),
                _buildProfileInfo("Email", email_, Icons.email),
                SizedBox(height: 16),
                _buildProfileInfo("Phone", phone_, Icons.phone),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value, IconData icon) {
    return Container(
      width: double.infinity,
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
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade800
                ),
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

  void sendData() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    final urls = Uri.parse(url + "/staff_viewprofile");

    try {
      final response = await http.post(urls, body: {'lid': lid});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'ok') {
          setState(() {
            email_ = data['email'].toString();
            name_ = data['name'].toString();
            phone_ = data['phone'].toString();
            role_ = data['role'].toString();
            busname_ = data['busname'].toString();
            image_ = data['image'];
          });
        } else {
          Fluttertoast.showToast(msg: 'Failed to fetch profile data');
        }
      } else {
        Fluttertoast.showToast(msg: 'Server error: ${response.statusCode}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e');
    }
  }
}