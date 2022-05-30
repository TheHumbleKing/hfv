import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class VendorChatContactsScreen extends StatefulWidget {
  static const String id = 'vendor_chat_contact_screen';
  final String userName;
  final String userEmail;
  const VendorChatContactsScreen(
      {required this.userName, required this.userEmail});
  @override
  _VendorChatContactsScreenState createState() =>
      _VendorChatContactsScreenState();
}

FirebaseFirestore firestoref = FirebaseFirestore.instance;
// User loggedin;
int userMessagesDonetill = 0;

class _VendorChatContactsScreenState extends State<VendorChatContactsScreen> {
  final sendtextcontroller = TextEditingController();
  //final _auth = FirebaseAuth.instance;
  var currentUserName;
  var currentUserEmail;
  var recieverEmail;
  String? messages;
  Future<void> getData(var userEmail) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      if (userEmail == data['Email']) {
        setState(() {
          //TODO: currentUserName
          // currentUserName =
          //     Provider.of<EmployeeProvider>(context, listen: false)
          //         .getEmployee
          //         .firstName;
          // currentUserName = 'Fahad';
        });
      }
    }
  }

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
    print(userMessagesDonetill);
  }

  @override
  void initState() {
    super.initState();
    //TODO: add name
    String name = "";
    // String name =
    //     '${Provider.of<EmployeeProvider>(context, listen: false).getEmployee.firstName}';
    //TODO: add Email
    // String email =
    //     Provider.of<EmployeeProvider>(context, listen: false).getEmployee.email;
    String email = "";

    if (name != null && email != null) {
      setState(() {
        currentUserName = name;
        currentUserEmail = email;
        recieverEmail = widget.userEmail;
      });
    }
  }

  void getuser() async {
    try {
      //TODO: add email
      //final email = Provider.of<EmployeeProvider>(context).getEmployee.email;
      final email = "";
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
              icon: Icon(Icons.close),
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
                      print(userMessagesDonetill);
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
  Messagestream(
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
              print('else if');
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
            padding: EdgeInsets.all(10.0),
            child: Material(
              borderRadius: widget.isme
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : BorderRadius.only(
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
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
