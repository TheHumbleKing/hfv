import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hfv_app/controllers/customer_controller.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'customer_person_image_time.dart';

class CustomerChatScreenMessageUser extends StatefulWidget {
  static const id = '/customer_chat_message_user_screen';
  // final String currentUserEmail;
  // const ChatScreenMessageUser({
  //   @required this.currentUserEmail,
  // });

  @override
  State<CustomerChatScreenMessageUser> createState() =>
      _CustomerChatScreenMessageUserState();
}

class _CustomerChatScreenMessageUserState
    extends State<CustomerChatScreenMessageUser> {
  // bool _isInit;
  bool _isLoading = true;
  final List<String> _emailsList = [];
  final List<String> _namesList = [];
  final userController = Get.put(UserController());
  //final List<String> _imageUrlsList = [];
  Future<void> getEmployeeData() async {
    final url = Uri.parse('http://192.168.18.141:51592/get_all/vendor');
    // GET http://192.168.18.141:51592/get_all/customer
    // GET http://192.168.18.141:51592/get_all/vendor
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as List<dynamic>;
    //TODO: get user email
    // String currentUserEmail =
    //     Provider.of<VisitorProvider>(context, listen: false).getVisitor.email;
    String currentUserEmail = userController.user.value.email;
    //print('extractedData=$extractedData');
    for (var element in extractedData) {
      _emailsList.add(element['email']);
      if (element['email'] != currentUserEmail) {
        setState(() {
          _namesList.add(element['firstName']);
          // _imageUrlsList.add(element['avatar']);
          _isLoading = false;
        });
      }
    }
    print('Name : $_namesList');
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
    getEmployeeData();
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
                  return VisitorPersonImageChatTime(
                    userName: _namesList[index],
                    userEmail: _emailsList[index],
                    // userImageUrl: _imageUrlsList[index],
                  );
                },
              ),
      ),
    );
  }
}
