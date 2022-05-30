import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class ListItem extends StatelessWidget {
  final String itemType;
  const ListItem({
    Key? key,
    required this.itemType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 119.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: redColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Center(
        child: Text(
          itemType,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
