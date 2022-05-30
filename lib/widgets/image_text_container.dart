import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class ImageTextContainerWidget extends StatelessWidget {
  final String imageurl;
  final String itemType;
  final bool isSoon;

  const ImageTextContainerWidget({
    Key? key,
    required this.imageurl,
    required this.itemType,
    this.isSoon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 397.h,
      height: 130.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      padding: EdgeInsets.only(right: 10.w, top: 5.h),
      child: Stack(
        children: [
          _soonTag(),
          _itemType(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageurl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Align _itemType() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 155.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                10.0,
              ),
              topRight: Radius.circular(10.0)),
          border: Border.all(width: 0.3.w, color: Colors.black),
        ),
        child: Center(
          child: Text(
            itemType,
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Visibility _soonTag() {
    return Visibility(
      visible: isSoon,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 110.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 0.5, color: Colors.blue),
            color: redColor,
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.red,
            //     blurRadius: 14.0, // soften the shadow
            //     spreadRadius: 1.0, //extend the shadow
            //     // offset: Offset(
            //     //   15.0, // Move to right 10  horizontally
            //     //   15.0, // Move to bottom 10 Vertically
            //     // ),
            //   )
            // ],
          ),
          child: const Center(
            child: Text(
              'Soon',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
