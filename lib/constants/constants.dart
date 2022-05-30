import 'package:flutter/material.dart';

const redColor = Color(0xffD53C25);
const blackColor = Color(0xff212121);
const blueColor = Color(0xff4760A9);
const lightBlueColor = Color(0xff5C89EF);
const greenColor = Color(0xff79B955);
const greyColor = Color(0xffF4F4F4);

const iconSize = 28.0;
const outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Color(0xffE6E6E6), width: 1.0),
);
const enableBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xffE6E6E6), width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);
const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xffE6E6E6), width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);
const hintStyle = TextStyle(
    color: Color(0xffA3A3A3), fontFamily: "", fontWeight: FontWeight.w400);
const darkBlueColor = Colors.blue;
const kPrimaryColor = Color(0xffE5E5E5);

/// Custom Stepper Class
const kStepperTextStyle = TextStyle(
  color: Colors.white,
);
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
