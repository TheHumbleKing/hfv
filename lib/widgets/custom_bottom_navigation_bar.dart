import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';
import 'package:hfv_app/controllers/customer_controller.dart';
import 'package:hfv_app/views/screens/add_to_cart_screen.dart';
import 'package:hfv_app/views/screens/customer_profile.dart';
import 'package:hfv_app/views/screens/vendor_profile.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

import '../views/screens/products_screen.dart';
// import '../views/screens/your_order_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  final userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        switch (index) {
          case 0:
            {
              Navigator.pushNamed(context, ProductsScreen.id);
              break;
            }
          case 1:
            {
              Navigator.pushNamed(context, AddToCartScreen.id);
              break;
            }
          case 2:
            {
              if (userController.user.value.userType == "CUSTOMER") {
                Get.to(const CustomerProfile());
              } else {
                Get.to(const VendorProfile());
              }

              // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>VendorProfile()));
              break;
            }
        }
      },
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            badgeContent: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
            child: Icon(_currentIndex == 1
                ? FontAwesomeIcons.squareFull
                : Icons.shopping_cart),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(_currentIndex == 2
              ? FontAwesomeIcons.squareFull
              : Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}
