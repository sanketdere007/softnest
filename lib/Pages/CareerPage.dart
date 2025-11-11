import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize;
    EdgeInsetsGeometry padding;

    if (screenWidth < 600) {
      // Mobile
      fontSize = 16;
      padding = EdgeInsets.all(16);
    } else if (screenWidth < 1024) {
      // Tablet
      fontSize = 20;
      padding = EdgeInsets.all(24);
    } else {
      // Desktop
      fontSize = 24;
      padding = EdgeInsets.all(32);
    }

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 800),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          '🚀 We are hiring! Join the Softnest team and grow with us.',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.blue[900],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}