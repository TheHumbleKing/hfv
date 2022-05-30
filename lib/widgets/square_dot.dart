import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

class SquareDots extends StatelessWidget {
  final int currentIndex;
  const SquareDots({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.squareFull,
          size: 8.w,
          color: redColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          FontAwesomeIcons.squareFull,
          size: 8.w,
          color: currentIndex > 0 ? redColor : greyColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          FontAwesomeIcons.squareFull,
          size: 8.w,
          color: currentIndex > 1 ? redColor : greyColor,
        ),
      ],
    );
  }
}
