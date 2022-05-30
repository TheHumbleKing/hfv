import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../widgets/vendor_person_image_time.dart';

class VendorChatScreenMessageUser extends StatefulWidget {
  static const id = '/vendor_chat_message_user_screen';
  // final String currentUserEmail;
  // const ChatScreenMessageUser({
  //   @required this.currentUserEmail,
  // });

  @override
  State<VendorChatScreenMessageUser> createState() =>
      _VendorChatScreenMessageUserState();
}

class _VendorChatScreenMessageUserState
    extends State<VendorChatScreenMessageUser> {
  // bool _isInit;
  bool _isLoading = true;
  final List<String> _emailsList = [];
  final List<String> _namesList = [];
  //final List<String> _imagesUrlList = [];
  //http://192.168.18.141:51592/get_all/customer
  //http://192.168.18.141:51592/get_all/vendor
  Future<void> getVisitorData() async {
    final url = Uri.parse('http://192.168.18.141:51592/get_all/customer');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as List<dynamic>;
    //TODO: current user email
    String currentUserEmail = "";
    // Provider.of<EmployeeProvider>(context, listen: false).getEmployee.email;
    for (final element in extractedData) {
      _emailsList.add(element['email']);
      if (element['email'] != currentUserEmail) {
        setState(() {
          _namesList.add(element['firstName']);
          //_imagesUrlList.add(element['avatar']);
          _isLoading = false;
        });
      }
    }
    print('Name : $_namesList');
    //print("imageUrls = $_imagesUrlList");
  }

  // final _auth = FirebaseAuth.instance;
  // Future<void> getData() async {
  //   var collection = FirebaseFirestore.instance.collection('users');
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     //final currentUserEmail = widget.currentUserEmail;
  //     final currentUserEmail = 'wqas@gmail.com';
  //     if (data['Email'] != currentUserEmail) {}
  //   }
  // }

  @override
  void initState() {
    getVisitorData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'Chats',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: const [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _namesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return VendorPersonImageChatTime(
                    userName: _namesList[index],
                    userEmail: _emailsList[index],
                    // userImageUrl: _imagesUrlList[index],
                  );
                },
              ),
      ),
    );
  }
}
