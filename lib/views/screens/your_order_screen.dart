import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/schedule_widget.dart';
import '../../widgets/tip_container.dart';


const titleTextFieldStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 15);

class YourOrderScreen extends StatefulWidget {
  static const String id = '/your-order-screen';
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  int currentTipSelector = 0;
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.cancel_presentation,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              ),
              Center(child: Text("Your Basket",style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20),
              Container(
                child: Center(child: Text("Basket Is Empty !",
                    style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),)),
              ),
              const SizedBox(height: 25),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Continue Browsing',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  child: Text("HFV Return Policy",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              Center(
                child: Container(
                  child: Text("Next Items can be returned",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              Center(
                child: Container(
                  child: Text("in 30 days",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text("Questions? We are here to help",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 30),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {},
                  child: const Text('Contact Us Screen',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 1,
        ),
      ),
    );
  }

  Widget _counterTipsRow() {
    return Row(
      //shrinkWrap: false,
      children: [
        const Text(
          "Courier tip",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          //width: 250.w,
          height: 35.h,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTipSelector = 1;
                  });
                },
                child: TipContainer(
                  currentNumber: currentTipSelector,
                  groupValue: 1,
                  text: "1",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTipSelector = 2;
                  });
                },
                child: TipContainer(
                  currentNumber: currentTipSelector,
                  groupValue: 2,
                  text: "3",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTipSelector = 3;
                  });
                },
                child: TipContainer(
                  currentNumber: currentTipSelector,
                  groupValue: 3,
                  text: "5",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _phoneNoTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          //Do something with the user input.
        },
        decoration: const InputDecoration(
          hintText: 'At least 50 characters',
          hintStyle: TextStyle(color: Color(0xffA3A3A3), fontFamily: ""),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: outlineBorder,
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }

  Container _flatNumberTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          //Do something with the user input.
        },
        decoration: const InputDecoration(
          hintText: 'At least 50 characters',
          hintStyle: TextStyle(color: Color(0xffA3A3A3), fontFamily: ""),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: outlineBorder,
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }

  Container _streetAddressTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          //Do something with the user input.
        },
        decoration: const InputDecoration(
          hintText: 'At least 50 characters',
          hintStyle: TextStyle(color: Color(0xffA3A3A3), fontFamily: ""),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: outlineBorder,
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  const OrderItem({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "3x",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Text(
              '101 Rose',
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w400,
                fontFamily: "",
              ),
            ),
            const Spacer(),
            const Text(
              "5\$",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
          ],
        ),
        Row(
          children: [
            _minusBtn(),
            const Spacer(),
            _addBtn(),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  GestureDetector _addBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          quantity++;
        });
      },
      child: const Icon(
        Icons.add_circle,
        color: redColor,
        size: 30.0,
      ),
    );
  }

  GestureDetector _minusBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (quantity > 1) {
            quantity--;
          }
        });
      },
      child: const Icon(
        Icons.remove_circle,
        color: redColor,
        size: 30.0,
      ),
    );
  }
}
