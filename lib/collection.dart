// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TicketCollectionPage extends StatefulWidget {
//   @override
//   _TicketCollectionPageState createState() => _TicketCollectionPageState();
// }
//
// class _TicketCollectionPageState extends State<TicketCollectionPage> {
//   final TextEditingController _ticketCountController = TextEditingController();
//   final TextEditingController _collectionController = TextEditingController();
//   DateTime _selectedDate = DateTime.now();
//
//   @override
//   void dispose() {
//     _ticketCountController.dispose();
//     _collectionController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _submitCollection() async {
//     final prefs = await SharedPreferences.getInstance();
//     String count = _ticketCountController.text.trim();
//     String amount = _collectionController.text.trim();
//     String date = _selectedDate.toIso8601String();
//     String? url = prefs.getString("url");
//     String? lid = prefs.getString("lid");
//
//     if (url == null || lid == null || count.isEmpty || amount.isEmpty) {
//       print("Error: Missing required data");
//       return;
//     }
//
//     var response = await http.post(
//       Uri.parse("${url}staff_send_collection"),
//       body: {
//         'count': count,
//         'amount': amount,
//         'date': date,
//         'lid': lid,
//       },
//     );
//
//     var jsonData = json.decode(response.body);
//     if (jsonData['status'] == 'ok') {
//       Navigator.pop(context);
//     } else {
//       print("Error submitting ticket collection");
//     }
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime.now(), // Restricts selection up to today
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Ticket Collection")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _ticketCountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(hintText: "Enter ticket count"),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _collectionController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(hintText: "Enter collection amount"),
//             ),
//             SizedBox(height: 16.0),
//             Text("Date: ${_selectedDate.toLocal()}".split(' ')[0]),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text("Select Date"),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitCollection,
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TicketCollectionPage extends StatefulWidget {
  @override
  _TicketCollectionPageState createState() => _TicketCollectionPageState();
}

class _TicketCollectionPageState extends State<TicketCollectionPage> {
  final TextEditingController _ticketCountController = TextEditingController();
  final TextEditingController _collectionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _ticketCountController.dispose();
    _collectionController.dispose();
    super.dispose();
  }

  Future<void> _submitCollection() async {
    final prefs = await SharedPreferences.getInstance();
    String count = _ticketCountController.text.trim();
    String amount = _collectionController.text.trim();
    String date = _selectedDate.toIso8601String();
    String? url = prefs.getString("url");
    String? lid = prefs.getString("lid");

    if (url == null || lid == null || count.isEmpty || amount.isEmpty) {
      print("Error: Missing required data");
      return;
    }

    var response = await http.post(
      Uri.parse("${url}staff_send_collection"),
      body: {
        'count': count,
        'amount': amount,
        'date': date,
        'lid': lid,
      },
    );

    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      Navigator.pop(context);
    }
    else if(jsonData['status'] == 'exist')
      {
        Fluttertoast.showToast(msg: "Already Updated...");
      }
    else {
      print("Error submitting ticket collection");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Collection", style: TextStyle(color: Colors.white)),
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
                    const Icon(Icons.confirmation_number, size: 50, color: Colors.blue),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _ticketCountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Ticket Count",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        prefixIcon: Icon(Icons.format_list_numbered, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _collectionController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Collection Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        prefixIcon: Text(' ₹ ', style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        )),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blue),
                      title: Text("Selected Date: ${_selectedDate.toLocal()}".split(' ')[0]),
                      trailing: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text("Change Date", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitCollection,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Submit Collection",
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




