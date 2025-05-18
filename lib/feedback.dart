// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class FeedbackPage extends StatefulWidget {
//   @override
//   _FeedbackPageState createState() => _FeedbackPageState();
// }
//
// class _FeedbackPageState extends State<FeedbackPage> {
//   final TextEditingController _feedbackController = TextEditingController();
//   double _rating = 3.0;
//
//   @override
//   void dispose() {
//     _feedbackController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _sendFeedback() async {
//     final prefs = await SharedPreferences.getInstance();
//     String feedback = _feedbackController.text.trim();
//     String? url = prefs.getString("url");
//     String? lid = prefs.getString("lid");
//
//     if (url == null || lid == null || feedback.isEmpty) {
//       print("Error: Missing required data");
//       return;
//     }
//
//     var response = await http.post(
//       Uri.parse("${url}user_send_feedback"),
//       body: {
//         'feedback': feedback,
//         'lid': lid,
//         'rating': _rating.toString(),
//       },
//     );
//
//     var jsonData = json.decode(response.body);
//     if (jsonData['status'] == 'ok') {
//       Navigator.pop(context);
//     } else {
//       print("Error submitting feedback");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Submit Feedback")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(hintText: "Enter your feedback..."),
//             ),
//             SizedBox(height: 16.0),
//             Text("Rating: ${_rating.toString()}", style: TextStyle(fontSize: 16)),
//             Slider(
//               value: _rating,
//               min: 1,
//               max: 5,
//               divisions: 4,
//               label: _rating.toString(),
//               onChanged: (value) {
//                 setState(() {
//                   _rating = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _sendFeedback,
//               child: Text("Submit Feedback"),
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

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 3.0;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _sendFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    String feedback = _feedbackController.text.trim();
    String? url = prefs.getString("url");
    String? lid = prefs.getString("lid");

    if (url == null || lid == null || feedback.isEmpty) {
      print("Error: Missing required data");
      return;
    }

    var response = await http.post(
      Uri.parse("${url}user_send_feedback"),
      body: {
        'feedback': feedback,
        'lid': lid,
        'rating': _rating.toString(),
      },
    );

    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      Navigator.pop(context);
    } else {
      print("Error submitting feedback");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Submit Feedback"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.blueAccent),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "We value your feedback!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Feedback", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _feedbackController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Enter your feedback...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text("Rating", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4.0),
                    Slider(
                      value: _rating,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      activeColor: Colors.blueAccent,
                      label: _rating.toString(),
                      onChanged: (value) {
                        setState(() {
                          _rating = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _sendFeedback,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text(
                          "Submit Feedback",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


