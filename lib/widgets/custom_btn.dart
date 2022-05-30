import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class CustomBlueBtn extends StatelessWidget {
  final String title;
  const CustomBlueBtn({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45.h,
        width: 200.w,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            color: lightBlueColor, borderRadius: BorderRadius.circular(6.0)),
        child: Center(
          child: Text(title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}
