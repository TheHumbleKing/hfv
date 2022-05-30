import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

class CustomImageRatingContainerWidget extends StatelessWidget {
  const CustomImageRatingContainerWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 289.h,
        width: 389.w,
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        color: Colors.white,
        child: Column(
          children: [
            _bgImageContainer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_priceDeliveryTime(), _itemPrice()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _bgImageContainer() {
    return Container(
      height: 192.h,
      width: 375.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column _priceDeliveryTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '101 Rose',
          style: TextStyle(
            color: Color(0xff1C1C1C),
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        _ratingBar(),
        SizedBox(
          height: 9.h,
        ),
        const Text(
          "2-3 Min Delivery",
          style: TextStyle(
              color: Color(0xff606060),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container _itemPrice() {
    return Container(
      height: 50.h,
      width: 80.w,
      color: const Color(0xffFAF6EB),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("\$  ",
              style: TextStyle(
                  fontSize: 18.0,
                  color: blackColor,
                  fontWeight: FontWeight.bold)),
          Text("\$25",
              style: TextStyle(
                  fontSize: 18.0,
                  color: redColor,
                  fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }

  RatingBar _ratingBar() {
    return RatingBar(
      initialRating: 4,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemSize: iconSize,
      itemCount: 5,
      //glowColor: Colors.pink,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star_border,
          color: Color(0xffFBCC61),
        ),
        empty: const Icon(
          Icons.star_border,
          color: Color(0xffCACACA),
        ),
        half: const Icon(
          Icons.star_border,
          color: Color(0xffCACACA),
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  }
}
