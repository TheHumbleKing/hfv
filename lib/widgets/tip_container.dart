import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class TipContainer extends StatelessWidget {
  final int currentNumber;
  final int groupValue;
  final String text;
  const TipContainer({
    Key? key,
    required this.currentNumber,
    required this.groupValue,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      color: currentNumber == groupValue ? greenColor : const Color(0xff2E2E2E),
      child: Center(
          child: Text("\$$text",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ))),
    );
  }
}
