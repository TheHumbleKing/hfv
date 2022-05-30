import 'package:flutter/material.dart';

class ViewUpdateProducts extends StatelessWidget {
  static const id = "/ViewUpdateProducts";
  String dropdownvalue = 'Select';
  var items = [
    'Delete Floor',
    'Update Floor',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Positioned(
                //   top: 80.0,
                //   left: 25.0,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         'Total Bill',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 24.0),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: Text(
                //           "&3710.00",
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18.0),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Positioned(
                //   top: 182.0,
                //   left: 314.0,
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.circular(40.0),
                //     child: Container(
                //       width: 45.0,
                //       height: 45.0,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(40.0),
                //         color: Colors.black,
                //       ),
                //       child: Center(
                //         child: Icon(
                //           Icons.more,
                //           color: Colors.white,
                //           size: 18.0,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      cardWidget(
                          context,
                          'assets/images/must.jpg',
                          'Basket Heave Floor',
                          // 'ID: 123456789',
                          // 'Auto Pay on 24th May 18',
                          '\$13.00',
                          '',
                          Colors.green),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      cardWidget(
                          context,
                          'assets/images/w1.jpg',
                          'Wooden Floor',
                          // 'ID: 123456789',
                          // 'Enable Auto Pay',
                          '\$14.00',
                          '',
                          Colors.grey),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      cardWidget(
                          context,
                          'assets/images/m7.jpg',
                          'Brick Floor',
                          // 'ID: 123456789',
                          // 'Enable Auto Pay',
                          '\$10.00',
                          '',
                          Colors.grey),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      cardWidget(
                          context,
                          'assets/images/must.jpg',
                          'Basket Heave Floor',
                          // 'ID: 123456789',
                          // 'Auto Pay on 24th May 18',
                          '\$13.00',
                          '',
                          Colors.green),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      cardWidget(
                          context,
                          'assets/images/w1.jpg',
                          'Wooden Floor',
                          // 'ID: 123456789',
                          // 'Enable Auto Pay',
                          '\$14.00',
                          '',
                          Colors.grey),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      cardWidget(
                          context,
                          'assets/images/m7.jpg',
                          'Brick Floor',
                          // 'ID: 123456789',
                          // 'Enable Auto Pay',
                          '\$10.00',
                          '',
                          Colors.grey),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 60.0, right: 60.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        'Erase All Floors',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => DetailScreen(),
                      // ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget(BuildContext context, String image, String title,
      String amount, String days, Color color) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(18.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 30.0,
        height: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    //color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10.0),
                                    //border: Border.all(color: Colors.black, width: 1),
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        amount,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: const Center(
                                              child: Text(
                                            "Select",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Column(
                    //         children: <Widget>[
                    //           Text(
                    //             amount,
                    //             style: const TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 16.0,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             days,
                    //             style: const TextStyle(
                    //                 color: Colors.grey,
                    //                 fontSize: 13.0,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Container(
                width: 5.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class OrangeClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0.0, size.height);
//     path.lineTo(size.width / 2 + 85.0, size.height);

//     var firstControlPoint = Offset(size.width / 2 + 140.0, size.height - 105.0);
//     var firstEndPoint = Offset(size.width - 1.0, size.height);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     path.lineTo(size.width, 0.0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class BlackClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0.0, size.height);
//     path.lineTo(size.width / 2 - 30.0, size.height);

//     var firstControlPoint =
//         Offset(size.width / 2 + 175.0, size.height / 2 - 30.0);
//     var firstEndPoint = Offset(size.width / 2, 0.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     path.lineTo(size.width / 2 + 75.0, size.height / 2 - 30.0);

//     path.lineTo(size.width / 2, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
