// import 'dart:convert';
// import 'dart:math';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
//
//
//
//
//
//
//
//
// class viewstopUSER extends StatelessWidget {
//   const viewstopUSER({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.red,
//       ),
//       home: const viewstopUSERPage(title: 'Flutter Demo Home Page'),
//       routes: {
//
//       },
//     );
//   }
// }
//
// class viewstopUSERPage extends StatefulWidget {
//   const viewstopUSERPage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<viewstopUSERPage> createState() => _viewstopUSERPageState();
// }
//
// class _viewstopUSERPageState extends State<viewstopUSERPage> {
//   int _counter = 0;
//
//   _viewstopUSERPageState() {
//     load();
//   }
//
//
//
//   List<String> rid_ = <String>[];
//   List<String> latitude_ = <String>[];
//   List<String> longitude_ = <String>[];
//   List<String> stopname_ = <String>[];
//
//   // List<String> Phone_ = <String>[];
//   // List<String> Email_ = <String>[];
//   // List<String> department_= <String>[];
//   // List<String> age_ = <String>[];
//   // List<String> gender_ = <String>[];
//
//
//   Future<void> load() async {
//     List<String> rid = <String>[];
//     List<String> latitude = <String>[];
//     List<String> longitude = <String>[];
//     List<String> stopname = <String>[];
//
//     // List<String> Email = <String>[];
//     // List<String> Phone = <String>[];
//     // List<String> department = <String>[];
//     // List<String> age = <String>[];
//     // List<String> gender = <String>[];
//
//
//
//     try {
//       final pref=await SharedPreferences.getInstance();
//       String vid= pref.getString("rid").toString();
//       String ip= pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url=ip+"view_stops";
//       print(url);
//       var data = await http.post(Uri.parse(url), body: {
//         'rid':vid
//       });
//
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       // List<String> schid_ = <String>[];
//       // List<String> Name_ = <String>[];
//       // List<String> type_ = <String>[];
//
//       for (int i = 0; i < arr.length; i++) {
//
//         rid.add(arr[i]['id'].toString());
//         stopname.add(arr[i]['Stop Name'].toString());
//         latitude.add(arr[i]['Latitude'].toString());
//         longitude.add(arr[i]['Longitude'].toString());
//
//         // Phone.add(arr[i]['phone'].toString());
//         // department.add(arr[i]['department'].toString());
//         // age.add(arr[i]['age'].toString());
//         // gender.add(arr[i]['gender'].toString());
//       }
//       setState(() {
//         rid_ = rid;
//         latitude_ = latitude;
//         longitude_ = longitude;
//         stopname_ = stopname;
//         // Email_ = Email;
//         // Phone_ = Phone;
//         // department_ = department;
//         // age_ = age;
//         // gender_ = gender;
//       });
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//             title: new Text(
//               "VIEW ROUTE",
//               style: new TextStyle(color: Colors.white),
//             ),
//             leading: new IconButton(
//               icon: new Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigator.pushNamed(context, '/home');
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const  MyHomePage(title: '',)),);
//                 print("Hello");
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ThirdScreen()),
//                 // );
//               },
//             )
//         ),
//
//         body:
//
//
//
//
//         ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: rid_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//                 onTap: () {
//
//
//
//
//                 },
//                 title: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     children: [
//
//
//                       Container(
//                         width: MediaQuery. of(context). size. width,
//                         height: 140,
//                         child: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//
//                               SizedBox(height: 16,),
//
//
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Stop Name")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(stopname_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () async {
//                                       String url = 'http://maps.google.com?q='+latitude_[index]+","+longitude_[index];
//
//                                       await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication); // Opens in an external browser
//
//
//
//                                     },
//                                     child: Icon(Icons.location_pin),
//                                   ),
//                                 ],
//                               ),
//
//
//
//
//
//                             ],
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           elevation: 5,
//                           margin: EdgeInsets.all(10),
//                         ),
//                       ),
//
//
//
//
//
//                     ],
//                   ),
//                 )
//
//
//             );
//           },
//
//         )
//
//
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//
//
//
// }
//


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class viewstopUSER extends StatelessWidget {
  const viewstopUSER({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Stops',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Blue theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const viewstopUSERPage(title: 'View Stops'),
    );
  }
}

class viewstopUSERPage extends StatefulWidget {
  const viewstopUSERPage({super.key, required this.title});

  final String title;

  @override
  State<viewstopUSERPage> createState() => _viewstopUSERPageState();
}

class _viewstopUSERPageState extends State<viewstopUSERPage> {
  List<String> rid_ = <String>[];
  List<String> latitude_ = <String>[];
  List<String> longitude_ = <String>[];
  List<String> stopname_ = <String>[];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    List<String> rid = <String>[];
    List<String> latitude = <String>[];
    List<String> longitude = <String>[];
    List<String> stopname = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String vid = pref.getString("rid").toString();
      String ip = pref.getString("url").toString();

      String url = "$ip/view_stops";
      var data = await http.post(Uri.parse(url), body: {'rid': vid});

      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        rid.add(arr[i]['id'].toString());
        stopname.add(arr[i]['Stop Name'].toString());
        latitude.add(arr[i]['Latitude'].toString());
        longitude.add(arr[i]['Longitude'].toString());
      }

      setState(() {
        rid_ = rid;
        latitude_ = latitude;
        longitude_ = longitude;
        stopname_ = stopname;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue, // Blue app bar
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: rid_.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue), // Icon
                      const SizedBox(width: 10),
                      Text(
                        "Stop Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        stopname_[index],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),

                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        String url =
                            'http://maps.google.com?q=${latitude_[index]},${longitude_[index]}';
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                      },
                      icon: const Icon(Icons.map, color: Colors.white), // Icon
                      label: const Text(
                        "View on Map",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Blue button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
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
