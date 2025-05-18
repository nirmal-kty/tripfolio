// import 'dart:convert';
// import 'dart:math';
//
//
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:project_new/view%20bus.dart';
// import 'package:project_new/view%20stop.dart';
// import 'package:project_new/viewschedule.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:project_new/view bus.dart';
//
//
//
//
//
//
//
// class viewROUTEUSER extends StatelessWidget {
//   const viewROUTEUSER({super.key});
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
//       home: const viewROUTEUSERPage(title: 'Flutter Demo Home Page'),
//       routes: {
//
//       },
//     );
//   }
// }
//
// class viewROUTEUSERPage extends StatefulWidget {
//   const viewROUTEUSERPage({super.key, required this.title});
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
//   State<viewROUTEUSERPage> createState() => _viewROUTEUSERPageState();
// }
//
// class _viewROUTEUSERPageState extends State<viewROUTEUSERPage> {
//   int _counter = 0;
//
//   _viewROUTEUSERPageState() {
//     load();
//   }
//
//
//
//   List<String> id_ = <String>[];
//   List<String> from_place_ = <String>[];
//   List<String> to_place_ = <String>[];
//
//
//   Future<void> load() async {
//     List<String> id = <String>[];
//     List<String> from_place = <String>[];
//     List<String> to_place = <String>[];
//
//
//
//
//     try {
//       final pref=await SharedPreferences.getInstance();
//
//       String ip= pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url=ip+"view_routes";
//       print(url);
//       var data = await http.post(Uri.parse(url), body: {
//
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
//         id.add(arr[i]['id'].toString());
//         from_place.add(arr[i]['from'].toString());
//         to_place.add(arr[i]['to'].toString());
//
//       }
//       setState(() {
//         id_ = id;
//         from_place_ = from_place;
//         to_place_ = to_place;
//
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
//               "VIEW ROUTES",
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
//           itemCount: id_.length,
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
//                         height: 150,
//                         child: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//
//                               SizedBox(height: 16,),
//
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("FROM PLACE")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(from_place_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//
//
//                               SizedBox(height: 16,),Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("TO PLACE")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(to_place_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [ ElevatedButton(
//                               onPressed: () async {
//
//                                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                                 prefs.setString('rid', id_[index]);
//
//
//
//                                 Navigator.push(
//                                   context,
//
//                                   MaterialPageRoute(builder: (context) => viewstopUSER()),
//                                 );
//
//                               },
//                               child: Text('VIEW STOP'),
//                             ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ElevatedButton(
//                                 onPressed: () async {
//                                   SharedPreferences prefs = await SharedPreferences.getInstance();
//                                   prefs.setString('rid', id_[index]);
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => viewshedule()),
//                                   );
//                                 },
//                                 child: Text('VIEW BUSES'),
//                               ),
//                             ],),
//
//
//
//
//                             ],
//
//
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
//
//

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_new/view%20bus.dart';
import 'package:project_new/view%20stop.dart';
import 'package:project_new/viewschedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewROUTEUSER extends StatelessWidget {
  const viewROUTEUSER({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Routes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const viewROUTEUSERPage(title: 'View Routes'),
    );
  }
}

class viewROUTEUSERPage extends StatefulWidget {
  const viewROUTEUSERPage({super.key, required this.title});
  final String title;

  @override
  State<viewROUTEUSERPage> createState() => _viewROUTEUSERPageState();
}

class _viewROUTEUSERPageState extends State<viewROUTEUSERPage> {
  List<String> id_ = [];
  List<String> from_place_ = [];
  List<String> to_place_ = [];

  _viewROUTEUSERPageState() {
    load();
  }

  Future<void> load() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url") ?? "";
      String url = "$ip/view_routes";
      var data = await http.post(Uri.parse(url));
      var jsondata = json.decode(data.body);

      if (jsondata['status'] == 'ok') {
        var arr = jsondata["data"];
        setState(() {
          id_ = arr.map<String>((item) => item['id'].toString()).toList();
          from_place_ = arr.map<String>((item) => item['from'].toString()).toList();
          to_place_ = arr.map<String>((item) => item['to'].toString()).toList();
        });
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: id_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("From: ${from_place_[index]}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("To: ${to_place_[index]}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('rid', id_[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => viewstopUSER()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: Text("View Stops", style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('rid', id_[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => viewshedule()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: Text("View Buses", style: TextStyle(color: Colors.white)),
                        ),
                      ],
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

