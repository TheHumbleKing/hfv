import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'image_square_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        ImageSquareDot(
          currentIndex: 0,
          imagePath: 'assets/images/b2.jpg',
        ),
        ImageSquareDot(
          currentIndex: 1,
          imagePath: 'assets/images/m7.jpg',
        ),
        ImageSquareDot(
          currentIndex: 2,
          imagePath: 'assets/images/must.jpg',
        ),
        ImageSquareDot(
          currentIndex: 2,
          imagePath: 'assets/images/b3.jpg',
        ),
      ],
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 3),
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
    );
  }
}
