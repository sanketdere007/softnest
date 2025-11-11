import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'CommonClassMethods.dart';
import 'FooterSection.dart';

class LandingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize;
    double subtitleFontSize;
    EdgeInsetsGeometry padding;

    if (screenWidth < 600) {
      titleFontSize = 26;
      subtitleFontSize = 14;
      padding = EdgeInsets.all(16);
    } else if (screenWidth < 1024) {
      titleFontSize = 34;
      subtitleFontSize = 16;
      padding = EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    } else {
      titleFontSize = 44;
      subtitleFontSize = 18;
      padding = EdgeInsets.symmetric(horizontal: 64, vertical: 40);
    }
    bool isDesktop = screenWidth >= ResponsiveBreakpoints.desktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Landing Banner Section
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrond.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Softnest Technologies',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Empowering software solutions with creativity & innovation.',
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF262262),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: subtitleFontSize, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        /// Our Services Section
        Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our Services',
                style: TextStyle(
                  fontSize: titleFontSize * 0.7,
                  fontWeight: FontWeight.bold,
                  color: ResponsiveBreakpoints.mainColor,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _serviceBox(Icons.web, "Web Development",
                      "Robust and scalable websites."),
                  _serviceBox(Icons.phone_android, "Mobile Apps",
                      "Flutter apps for Android & iOS."),
                  _serviceBox(Icons.cloud, "Cloud Integration",
                      "Seamless cloud-based solutions."),
                ],
              ),
            ],
          ),
        ),

        /// Testimonials Section
        Container(
          color: Colors.grey.shade100,
          padding: padding,
          child: Column(
            children: [
              Text(
                'Client Testimonials',
                style: TextStyle(
                  fontSize: titleFontSize * 0.7,
                  fontWeight: FontWeight.bold,
                  color: ResponsiveBreakpoints.mainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: isDesktop ? 0.3 : 0.9,
                ),
                items: [
                  _testimonialCard(
                      "Softnest delivered an amazing mobile app. Great team and timely delivery!",
                      "– Riya Sharma"),
                  _testimonialCard(
                      "Highly recommend their web development services. Professional and supportive!",
                      "– Rajiv Mehta"),
                  _testimonialCard(
                      "The Softnest team really understands client needs and delivers with excellence.",
                      "– Ankit Patel"),
                ],
              ),
            ],
          ),
        ),

        ///  Footer Section
        Footersection(),
      ],
    );
  }

  Widget _serviceBox(IconData icon, String title, String description) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          SizedBox(height: 12),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _testimonialCard(String feedback, String author) {
    return Container(
      width: 400,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.format_quote, color: Colors.blueAccent, size: 30),
          Text(
            feedback,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 1,
            color: Colors.blueAccent.withOpacity(0.3),
            indent: 30,
            endIndent: 30,
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
