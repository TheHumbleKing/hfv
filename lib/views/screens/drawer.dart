import 'package:flutter/material.dart';
import 'package:hfv_app/views/screens/products_screen.dart';
import 'package:hfv_app/views/screens/your_order_screen.dart';

// import 'screens/signup.dart';
import './signup.dart';
import 'search_flowers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsScreen(),
      routes: {
        //AddToCartScreen.id: (context) =>  AddToCartScreen(),
        SearchBarScreen.id: (context) => const SearchBarScreen(),
        ProductsScreen.id: (context) => const ProductsScreen(),
        YourOrderScreen.id: (context) => const YourOrderScreen(),
      },
    );
  }
}
