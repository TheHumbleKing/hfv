import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApiScreen extends StatelessWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/hfv-app-2f84e.appspot.com/o/images.jpg?alt=media&token=37606c3b-870f-43ef-b5a1-1b13505ae1e1"),
          ),
          Center(
              child: InkWell(
            onTap: () {
              //print("clicked");
              //etCustomerData();
              getVendorData();
            },
            child: Container(
              width: 150,
              height: 40,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Test Api",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  void getCustomerData() async {
    print("api called");
    final url = Uri.parse("http://192.168.18.141:51592/get_all/customer");
    try {
      final response = await http.get(url);
      print("statusCode=${response.statusCode}");
      print("body=${response.body}");
      final body = jsonDecode(response.body);
      final extractedData = body as List<dynamic>;
      print("extractedData=$extractedData");
      print("email=${extractedData[0]['email']}");
      print("firstName=${extractedData[0]['firstName']}");
      print("lastName=${extractedData[0]['lastName']}");
    } on Exception catch (e) {
    } catch (e) {
      print("error=$e");
    }
  }

  void getVendorData() async {
    print("api called");
    final url = Uri.parse("http://192.168.18.141:51592/get_all/vendor");
    try {
      final response = await http.get(url);
      print("statusCode=${response.statusCode}");
      print("body=${response.body}");
      final body = jsonDecode(response.body);
      final extractedData = body as List<dynamic>;
      print("extractedData=$extractedData");
      print("email=${extractedData[0]['email']}");
      print("firstName=${extractedData[0]['firstName']}");
      print("lastName=${extractedData[0]['lastName']}");
    } on Exception catch (e) {
    } catch (e) {
      print("error=$e");
    }
  }
}
