import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_carousel_slider.dart';

class AddToCartScreen extends StatelessWidget {
  static const id = '/add-to-cart-screen';
  final String title;
  final String imageUrl;
  final String price;
  final String itemType;

  const AddToCartScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.itemType,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(360, 690),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselWidget(),
        SizedBox(
          height: 20.h,
        ),
        ListTile(
          leading: Text(
            title,
            style: const TextStyle(
              fontFamily: "Helvetica",
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          trailing: Container(
            color: const Color(0xFFFFFFFF),
            width: 59.w,
            height: 24.h,
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  itemType,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(
          indent: 17.w,
          endIndent: 15.w,
          color: Colors.grey[400],
          thickness: 0.5,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price:",
                    style: TextStyle(color: blackColor, fontSize: 18.0,),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  const Text(
                    "23.55",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
              _addToCartBtn(context)
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Text(
            "1 Pc Wooden Floor Panel Sheet - Vinyl Floor Sheeting, Wood Texture Sheet, 150x900mm Decoration Covering Sheets, Wooden Color Design",
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
        //   child: Row(
        //     children: [
        //       const Image(
        //         image: AssetImage("assets/images/w1.jpg"),
        //       ),
        //       SizedBox(
        //         width: 12.w,
        //       ),
        //       const Text(
        //         "30 minutes delivery time",
        //         style: TextStyle(
        //           fontFamily: 'Helvetica',
        //           fontWeight: FontWeight.w900,
        //           fontSize: 15.0,
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }

  GestureDetector _addToCartBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 230.w,
        height: 40.h,
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.shopping_bag_outlined, color: Colors.white),
            Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                fontFamily: "Helvetica",
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      leading: Transform.rotate(
        angle: math.pi,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        'Flooring Layouts',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: const [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
      ],
    );
  }
}
