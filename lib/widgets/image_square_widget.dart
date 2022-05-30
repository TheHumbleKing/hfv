import 'package:hfv_app/widgets/square_dot.dart';
import 'package:flutter/material.dart';

class ImageSquareDot extends StatelessWidget {
  final int currentIndex;
  final String imagePath;

  const ImageSquareDot({
    Key? key,
    required this.currentIndex,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: SquareDots(
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
