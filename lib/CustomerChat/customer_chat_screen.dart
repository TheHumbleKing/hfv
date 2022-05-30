import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hfv_app/constants/constants.dart';
import 'package:hfv_app/controllers/customer_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VisitorChatContactsScreen extends StatefulWidget {
  static const String id = 'visitor_chat_contact_screen';
  final String userName;
  final String userEmail;
  const VisitorChatContactsScreen(
      {required this.userName, required this.userEmail});
  @override
  _VisitorChatContactsScreenState createState() =>
      _VisitorChatContactsScreenState();
}

FirebaseFirestore firestoref = FirebaseFirestore.instance;
// User loggedin;
int userMessagesDonetill = 0;

class _VisitorChatContactsScreenState extends State<VisitorChatContactsScreen> {
  final sendtextcontroller = TextEditingController();
  final userController = Get.put(UserController());
  //final _auth = FirebaseAuth.instance;
  var currentUserName;
  var currentUserEmail;
  var recieverEmail;
  var _isLoading = false;

  String? messages;

  Future<void> getData(var userEmail) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      if (userEmail == data['Email']) {
        setState(() {
          // currentUserName = Provider.of<VisitorProvider>(context, listen: false)
          //     .getVisitor
          //     .firstName;
          currentUserEmail = userController.user.value.email;
          currentUserName = userController.user.value.firstName;
        });
      }
    }
  }

  // void postData(BuildContext context) async {
  //   //Logged In Visitor Id will be entered
  //   // String visitorId = '61292ccba64b18000460842a';
  //   // final visitorData =
  //   //     Provider.of<VisitorProvider>(context, listen: false).getVisitor;
  //   // String _visitorId = visitorData.id;

  //   final routeArgs =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   String _employeeId = routeArgs[currentUserEmail];
  //   // 6160912d9ddfb800041e6fd5
  //   //// String _employeeId = '6160912d9ddfb800041e6fd5';
  //   // print('empId=${_employeeId}');
  //   // print('visitorId=${_emailController.text.toString()}');
  //   // print('startTime=${_selectedStartTime}');
  //   // print('endTime=${_selectedEndTime}');
  //   // print('reason=${_visitorReasonField.text.toString()}');
  //   // print('image=$_imageUrl');
  //   // print('firstName=${_firstNameController.text.toString()}');
  //   // print('lastName=${_lastNameController.text.toString()}');
  //   // print('company=${_companyController.text.toString()}');
  //   // print('message=${_visitorReasonField.text.toString()}');

  //   setState(() {});

  //   final url = Uri.parse(
  //       'https://pure-woodland-42301.herokuapp.com/api/visitor/runInappointment');
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(
  //         <String, String>{
  //           'name': currentUserName,
  //           'message': sendtextcontroller.text,
  //           'email': currentUserEmail,
  //         },
  //       ),
  //     );
  //     //print(jsonDecode(response.body)['error']);
  //     print('appountmentCode=${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       print('appointmentSent=${response.statusCode}');
  //     } else {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }

  //   print('empId=$_employeeId');
  // }

  Future<void> getMessagesLength() async {
    var collection = FirebaseFirestore.instance.collection('messages');
    var querySnapshot = await collection.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      setState(() {
        userMessagesDonetill++;
      });
    }
    if (userMessagesDonetill > 0) {
      setState(() {
        userMessagesDonetill++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //First Name
    // String name =
    //     '${Provider.of<VisitorProvider>(context, listen: false).getVisitor.firstName}';
    String name = userController.user.value.firstName;
    //Email
    // String email =
    //     Provider.of<VisitorProvider>(context, listen: false).getVisitor.email;
    String email = userController.user.value.email;

    setState(() {
      currentUserName = name;
      currentUserEmail = email;
      recieverEmail = widget.userEmail;
    });
  }

  void getuser() async {
    try {
      //final email = Provider.of<VisitorProvider>(context).getVisitor.email;
      final email = userController.user.value.email;
      //Done till
      if (email == currentUserEmail) {}
      //getData(email);
      //loggedin = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text(widget.userName),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Messagestream(currentUserName, widget.userName, currentUserEmail,
                recieverEmail),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: sendtextcontroller,
                      onChanged: (value) {
                        messages = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var collection =
                          FirebaseFirestore.instance.collection('messages');
                      var querySnapshot = await collection.get();
                      for (int i = 0; i < querySnapshot.docs.length; i++) {
                        setState(() {
                          userMessagesDonetill++;
                        });
                      }
                      if (userMessagesDonetill > 0) {
                        setState(() {
                          userMessagesDonetill++;
                        });
                      }
                      //print(userMessagesDonetill);
                      sendtextcontroller.clear();
                      firestoref
                          .collection('messages')
                          .doc('${userMessagesDonetill + 10}')
                          .set({
                        'reciever': widget.userName,
                        'sender': currentUserName,
                        'smessage': messages,
                        'senderemail': currentUserEmail,
                        'recieveremail': recieverEmail,
                        'dateTime': DateTime.now(),
                      });
                      setState(() {
                        userMessagesDonetill = 0;
                      });
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messagestream extends StatefulWidget {
  final String namefinding;
  final String textUserName;
  final String emailfinding;
  final String textemail;
  const Messagestream(
      this.namefinding, this.textUserName, this.emailfinding, this.textemail);
  @override
  State<Messagestream> createState() => _MessagestreamState();
}

class _MessagestreamState extends State<Messagestream> {
  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "mint" : "mints"} ago";
    }
    return "just now";
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestoref.collection('messages').snapshots(),
        // ignore: non_constant_identifier_names
        builder: (context, Snapshot) {
          if (!Snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ));
          }
          final messagesdata = Snapshot.data!.docs;
          List<Messagebubble> messageswidget = [];
          for (var msg in messagesdata) {
            final msgsender = msg.get('sender');
            final msginfo = msg.get('smessage');
            final msgreciever = msg.get('reciever');
            final senderemail = msg.get('senderemail');
            final recieveremail = msg.get('recieveremail');
            final rightnowtime = msg.get('dateTime').toDate();
            final dateTime = timeAgo(rightnowtime);
            final currentuser = widget.namefinding;
            if (msgsender == currentuser &&
                msgreciever == widget.textUserName &&
                senderemail == widget.emailfinding &&
                recieveremail == widget.textemail) {
              final messageget = Messagebubble(
                sender: msgsender,
                smsg: msginfo,
                isme: currentuser == msgsender,
                dateTimes: dateTime,
              );
              messageswidget.add(messageget);
            } else if (msgsender == widget.textUserName &&
                msgreciever == currentuser &&
                senderemail == widget.textemail &&
                recieveremail == widget.emailfinding) {
              final messageget = Messagebubble(
                sender: msgsender,
                smsg: msginfo,
                isme: currentuser == msgsender,
                dateTimes: dateTime,
              );
              messageswidget.add(messageget);
            }
          }
          return Expanded(
            child: ListView(
              reverse: false,
              children: messageswidget,
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class Messagebubble extends StatefulWidget {
  Messagebubble(
      {Key? key,
      required this.sender,
      required this.smsg,
      required this.isme,
      required this.dateTimes})
      : super(key: key);
  final String sender;
  final String smsg;
  bool isme;
  String dateTimes;

  @override
  State<Messagebubble> createState() => _MessagebubbleState();
}

class _MessagebubbleState extends State<Messagebubble> {
  @override
  Widget build(BuildContext context) {
    //currentTime = ;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            widget.isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            widget.sender,
            style: TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              borderRadius: widget.isme
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
              elevation: 5,
              color: widget.isme ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Text(
                  widget.smsg,
                  style: TextStyle(
                      color: widget.isme ? Colors.white : Colors.black,
                      fontSize: 15.0),
                ),
              ),
            ),
          ),
          Text(
            widget.dateTimes,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
