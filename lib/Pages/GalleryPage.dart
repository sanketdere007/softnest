import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  final List<String> images = List.generate(
    3,
        (index) => 'assets/softnest${1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive height based on screen width
    double sliderHeight;
    if (screenWidth < 600) {
      // Mobile
      sliderHeight = 190;
    } else if (screenWidth < 1024) {
      // Tablet
      sliderHeight = 290;
    } else {
      // Desktop
      sliderHeight = 440;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: sliderHeight,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
          ),
          items: images.map((imgPath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: screenWidth * 0.8,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}