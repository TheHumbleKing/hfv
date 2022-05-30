import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hfv_app/controllers/customer_controller.dart';
import 'package:hfv_app/views/screens/chat_screen.dart';
import '../../CustomerChat/customer_chat_messagesuser_screen.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import 'login.dart';
import 'package:get/get.dart';

class CustomerProfile extends StatefulWidget {
  static const id = "/product_screen";

  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  // final List<Widget> _productsList = const [
  final userController = Get.put(UserController());
  Icon customIcon = const Icon(Icons.shopping_cart);
  Widget customSearchBar = const Text('Search Product');

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(360, 690),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/must.jpg"),
                              fit: BoxFit.fill),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "${userController.user.value.firstName} ${userController.user.value.lastName}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            const Divider(
              color: Colors.black,
              height: 10,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    // color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        const Text(
                          "Your Order",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        Text(
                          "Liked Products",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.view_agenda,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        Text(
                          "Manage Vendors",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.message,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(CustomerChatScreenMessageUser());
                            },
                            child: Text(
                              "Message Vendor",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
              ]),
            ),
            const SizedBox(height: 1),
            Container(
              height: 75,
              // width: 2,
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.question_mark_rounded,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      Text(
                        "HFV Support",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Sign Out",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Text(
                      "data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
