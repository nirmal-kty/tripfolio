
import 'package:flutter/material.dart';
import 'package:project_new/feedback.dart';
import 'package:project_new/staff_update_bus_staff.dart';
import 'package:project_new/view%20bus.dart';
import 'package:project_new/viewroute.dart';
import 'package:project_new/viewroutestaff.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:project_new/update_stop_time.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'login.dart';
class drawerstaff extends StatelessWidget {
  const drawerstaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              "My App",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                // Handle icon button press
              },
              icon: const Icon(Icons.home),
            ),
            title: const Text("Home"),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
            },

          ),
          ListTile(
            leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.directions_bus)),
            title: const Text("UPDATE STATUS"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateBusStatusScreen()));
            },
          ),

          ListTile(
            leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.directions_bus)),
            title: const Text("VIEW SCHEDULE"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBusUser()));
            },
          ),

          // ListTile(
          //   leading:
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.directions_bus)),
          //   title: const Text("Update Stop"),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateStopTimeScreen()));
          //   },
          // ),
          // ListTile(
          //   leading: IconButton(onPressed: () {}, icon: const Icon(Icons.bus_alert)),
          //   title: const Text("TRACK LOCATION"),
          //   onTap: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
          //
          //   },
          // ),
          // ListTile(
          //   leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
          //   title: const Text("FEEDBACK"),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
          //
          //   },
          // ),
          // ListTile(
          //   leading: IconButton(onPressed: () {}, icon: const Icon(Icons.book_online)),
          //   title: const Text("booking"),
          //   onTap: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()));
          //   },
          // ),
          // ListTile(
          //   leading: IconButton(onPressed: () {}, icon: const Icon(Icons.payment)),
          //   title: const Text("SCAN QR AND PAY"),
          //     onTap: () {
          //       // Navigator.push(context, MaterialPageRoute(builder: (context) => YourScreen()));
          //     },
          //
          //
          //
          // ),

          // ListTile(
          //   leading: IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          //   title: const Text("Logout"),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const login()),
          //     );
          //   },
          // ),

          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              final sh = await SharedPreferences.getInstance();
              await sh.clear(); // Clear all stored data

              // Use pushAndRemoveUntil to clear the entire navigation stack
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const login()),
                    (Route<dynamic> route) => false, // This removes all routes
              );
            },
          ),
        ],
      ),
    );
  }
}