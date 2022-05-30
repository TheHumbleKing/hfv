import 'package:flutter/material.dart';
import 'package:hfv_app/VendorChat/vendor_chat_screen.dart';
import 'package:hfv_app/views/screens/EditCustomer.dart';
import 'package:hfv_app/views/screens/EditVendor.dart';
import 'package:hfv_app/views/screens/ViewUpdateProducts.dart';
import 'package:hfv_app/views/screens/add_to_cart_screen.dart';
import 'package:hfv_app/views/screens/chat_screen.dart';
import 'package:hfv_app/views/screens/forget_password.dart';
import 'package:hfv_app/views/screens/productlistingscreen.dart';
import 'package:hfv_app/views/screens/products_screen.dart';
import 'package:hfv_app/views/screens/customer_profile.dart';
import 'package:hfv_app/views/screens/recovery_password.dart';
import 'package:hfv_app/views/screens/vendor_profile.dart';
import 'package:hfv_app/views/screens/your_order_screen.dart';
import 'views/screens/login.dart';
import 'package:get/get.dart';
import 'views/screens/searchProduct.dart';
import 'views/screens/test_api_screen.dart';
// import 'package:hfv_app/views/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      // home: const LoginScreen(),
      // home: YourOrderScreen(),
      // home: const ProductsScreen(),
      // home: const recovery_password(),
      // home: const forget_password(),
      home: const LoginScreen(),
      // home: const TestApiScreen(),
      // home: const EditCustomer(),
      // home: const EditVendor(),
      // home: ViewUpdateProducts(),

      routes: {
        //AddToCartScreen.id: (context) =>  AddToCartScreen(),
        ViewUpdateProducts.id: (context) => ViewUpdateProducts(),
        EditVendor.id: (context) => const EditVendor(),
        // EditVendor.id: (context) => const EditVendor(),
        EditCustomer.id: (context) => const EditCustomer(),
        recovery_password.id: (context) => const recovery_password(),
        forget_password.id: (context) => const forget_password(),
        ProductsScreen.id: (context) => const ProductsScreen(),
        YourOrderScreen.id: (context) => const YourOrderScreen(),
        // ignore: equal_keys_in_map
        VendorProfile.id: (context) => const VendorProfile(),

        CustomerProfile.id: (context) => const CustomerProfile(),
        AddToCartScreen.id: (context) => const AddToCartScreen(
            title: "Wooden Floor",
            imageUrl: "despacito/images",
            price: "4,200",
            itemType: "Organic"),
        ProductsScreen.id: (context) => const ProductsScreen(),
        YourOrderScreen.id: (context) => const YourOrderScreen(),
      },
    );
    //   MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'HFV',
    //   theme: ThemeData(
    //     primaryColor: Colors.blue,
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const Login(),
    // );
  }
}
