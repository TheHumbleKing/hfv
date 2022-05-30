import 'package:flutter/material.dart';

enum UserType { customer, vendor }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserType _type = UserType.customer;
  UserType _type2 = UserType.vendor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Create an account'),
      ),
      body: Center(
        child: SafeArea(
          child: Center(
            child: Padding(

              padding: const EdgeInsets.all(38.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        activeColor: Colors.black,
                        groupValue: _type,
                        value: UserType.customer,
                        onChanged: (UserType? value) {
                          setState(() {
                            _type = value!;
                          });
                        },
                      ),
                      const Text ("Customer" ,
                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
            ),
                      const SizedBox(
                        width: 50,
                      ),
                      Radio(
                        activeColor: Colors.black,
                        groupValue: _type,
                        value: UserType.vendor,
                        onChanged: (UserType? value) {
                          setState(() {
                            _type = value!;
                          });
                        },
                      ),
                      const Text("Vendor",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your details below',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: const Text('First Name'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text('Last Name'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: const Text('Email Address'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text('Confirm Password'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: MaterialButton(
                      color: Colors.black,
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
