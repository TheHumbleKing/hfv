import 'package:flutter/material.dart';
import 'package:hfv_app/controllers/customer_controller.dart';
import 'package:hfv_app/defs/customer.dart';
import 'package:hfv_app/http_libs/creds.dart';
import 'package:hfv_app/http_libs/entry_libs.dart';
import 'package:hfv_app/views/screens/ar_view.dart';
import 'package:hfv_app/views/screens/products_screen.dart';
import 'package:hfv_app/views/screens/signup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../controllers/vendor_controller.dart';

enum UserType { customer, vendor }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserType _type = UserType.customer;
  final storage = const FlutterSecureStorage();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final customerController = Get.put(UserController());
  final vendorController = Get.put(VendorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.jpg',
                        width: 180,
                        height: 100,
                      ),
                      const Text(
                        "HFV Login",
                        style: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
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
                      const Text("Customer"),
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
                      const Text("Vendor"),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          label: const Text('Email address'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUp(),
                          ),
                        ),
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: MaterialButton(
                      color: Colors.black,
                      onPressed: () async {
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        print(email + " " + password);
                        User? res =
                            await login(baseUrl, email, password, cookies);

                        if (res != null) {
                          print("userType = ${res.userType}");
                          customerController.user.value = res;
                          Get.offAll(const ProductsScreen());
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const ProductsScreen()));
                        }
                        // print(res);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUp(),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
