import 'dart:convert';


import 'package:flutter/material.dart';

import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // TextEditingController dateInputController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  // final TextEditingController postController = TextEditingController();
  // final TextEditingController pinController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedGender;
  final _formKey = GlobalKey<FormState>(); // Add a global key for the form




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Trip Folio"),
        ),
        body: SafeArea(
            child:Form(
                key: _formKey, child: SingleChildScrollView(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: lnameController,
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.white,
                  //       border: OutlineInputBorder(),
                  //       hintText: "Last Name",
                  //     ),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter your last name';
                  //       }
                  //       return null; // Return null if the input is valid
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: placeController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "place",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your place';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: postController,
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.white,
                  //       border: OutlineInputBorder(),
                  //       hintText: "post",
                  //     ),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter your post';
                  //       }
                  //       return null; // Return null if the input is valid
                  //     },
                  //   ),
                  // ),

                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: pinController,
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.white,
                  //       border: OutlineInputBorder(),
                  //       hintText: "pin",
                  //     ),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter your pin';
                  //       }
                  //       return null; // Return null if the input is valid
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "Phone",
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Email",
                          ))),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null; // Return null if the input is valid
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null; // Return null if the input is valid
                        },)), Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if(!_formKey.currentState!.validate())
                        {print("vvvvvvvvvvvvvvvvvvv");}
                        else{
                          final sh = await SharedPreferences.getInstance();
                          String name=nameController.text.toString();
                          String place=placeController.text.toString();
                          String ph_no=phoneController.text.toString();
                          String email=emailController.text.toString();
                          String username=usernameController.text.toString();
                          String pwd=passwordController.text.toString();
                          String url = sh.getString("url").toString();
                          var data = await http.post(
                              Uri.parse(url+"registrationcode"),
                              body: {
                                'name':name,
                                'place':place,
                                'phone':ph_no,
                                'email':email,
                                'username':username,
                                'password':pwd,
                              });

                          var jasondata = json.decode(data.body);
                          String status=jasondata['task'].toString();
                          if(status=="success")
                          {

                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => login()));

                          }
                          else{
                            print("error");

                          }}

                      },
                      icon: Icon(Icons.send),
                      label: Text('Submit'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF6ADC50), // Use a proper color value (e.g., Hex or RGB)
                        ),
                      ),
                    ),
                  )])))
        ));
  }
}