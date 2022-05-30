import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../VendorChat/vendor_chat_messagesuser_screen.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import 'chat_screen.dart';
import 'login.dart';
import 'package:get/get.dart';

class VendorProfile extends StatefulWidget {
  static const id = "/product_screen";

  const VendorProfile({Key? key}) : super(key: key);

  @override
  State<VendorProfile> createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {
  // final List<Widget> _productsList = const [
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
              padding: const EdgeInsets.all(20),
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
                      const Text(
                        "Vendor Profile",
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
              padding: const EdgeInsets.all(10),
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
                          Icons.plus_one_sharp,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        const Text(
                          "Add Product",
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
                        const Icon(
                          Icons.manage_accounts,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        const Text(
                          "Manage Products",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Doge'), value: 'Doge'),
                            new PopupMenuItem<String>(
                                child: const Text('Lion'), value: 'Lion'),
                          ],
                          onSelected: (value) {},
                        )
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
                      children: const [
                        Icon(
                          Icons.view_agenda,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        Text(
                          "Manage Customers",
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
                  onTap: () {
                    Get.to(VendorChatScreenMessageUser());
                  },
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
                              Get.to(VendorChatScreenMessageUser());
                            },
                            child: const Text(
                              "Message Customer",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        const Icon(
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
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
              padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
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
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "Sign Out",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Text(
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
