import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'home.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  (title: 'Sent Complaint'),
    );
  }
}


class user_profile extends StatefulWidget {
  const user_profile({super.key, required this.title});


  final String title;

  @override
  State<user_profile> createState() => _user_profileState();
}
class _user_profileState extends State<user_profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    senddata();
  }


  // return JsonResponse({'status': 'ok', 'name': d.name,
  // 'Address':d.Address,'email':d.email,
  // 'phone':d.phone})




  String name_='name';
  // String pin='pin';
  String place_='place';
  String phone_='phone';
  String email_='email';
  // String image='image';
  // String pin='pin';






  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        return false;

      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // SizedBox(
              //   height: 280,
              //   width: double.infinity,
              //   child: Image.network(image,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
                child: InkWell(
                  onTap: (){
                    // showDialog(context: context, builder: (context) => Image.network(photo),);
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.only(top: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 110.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              name_,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            // Text(
                                            //   '$email',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .bodyText1,
                                            // ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        CircleAvatar(
                                          backgroundColor: Colors.blueAccent,
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));                                              },
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: Colors.white,
                                                size: 18,
                                              )
                                          ),
                                        )
                                      ],
                                    )),
                                // SizedBox(height: 10.0),
                                Row(
                                  children: [

                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 90,
                          //   width: 90,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20.0),
                          //       image:  DecorationImage(
                          //           image: NetworkImage(
                          //               image),
                          //           fit: BoxFit.cover)),
                          //   margin: EdgeInsets.only(left: 20.0),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children:  [
                            ListTile(
                              title: Text("Profile Information"),
                            ),
                            Divider(),

                            ListTile(
                              title: Text('Place'),
                              subtitle: Text( ' ${place_}  '),
                              leading: Icon(Icons.location_city),
                            ), Divider(),

                            // ListTile(
                            //   title: Text('Pin'),
                            //   subtitle: Text( ' ${pin}  '),
                            //   leading: Icon(Icons.location_city),
                            // ),




                            ListTile(
                              title: Text('Email'),
                              subtitle: Text(email_),
                              leading: Icon(Icons.mail_outline),
                            ),
                            ListTile(
                              title: Text("Phone"),
                              subtitle: Text(phone_),
                              leading: Icon(Icons.phone),
                            ),






                            SizedBox(
                              height: 10,
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: MaterialButton(
                  minWidth: 0.2,
                  elevation: 0.2,
                  color: Colors.white,
                  child: const Icon(Icons.arrow_back_ios_outlined,
                      color: Colors.indigo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Home (),));

                  },
                ),
              ),

            ],

          ),

        ),

      ),
    );
  }





  void senddata()async{



    SharedPreferences sh=await SharedPreferences.getInstance();
    String url=sh.getString('url').toString();
    String lid=sh.getString('lid').toString();
    final urls=Uri.parse(url+"/user_viewprofile");
    try{
      final response=await http.post(urls,body:{
        'lid':lid,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {






          setState(() {
            email_=jsonDecode(response.body)['email'].toString();
            name_=jsonDecode(response.body)['name'].toString();
            phone_=jsonDecode(response.body)['phone'].toString();
            // pin=jsonDecode(response.body)['pin'].toString();
            place_=jsonDecode(response.body)['place'].toString();
            // pin=jsonDecode(response.body)['pin'].toString();
            // post=jsonDecode(response.body)['post'].toString();
            // district=jsonDecode(response.body)['district'].toString();
            // image=sh.getString('imgurl2').toString()+jsonDecode(response.body)['image'];







          });

        }else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }

  }

}