import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FooterSection.dart';

class AboutSection extends StatelessWidget {
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

    return Column(
      children: [
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
            gradient: LinearGradient(
              colors: [
                Color(0xFF262262).withOpacity(0.7),
                Colors.blueAccent.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'About Us',
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
                  'Explore Services',
                  style: TextStyle(
                      fontSize: subtitleFontSize, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),

        /// Detailed Paragraphs
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '• Who We Are:',
              style: TextStyle(
                fontSize: subtitleFontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'SoftNest Technologies Pvt Ltd is a team of passionate tech professionals committed to delivering high-performance digital solutions. With a strong foundation in Flutter, .NET, and SQL, we serve startups to enterprises with scalable and secure applications.',
              style: TextStyle(fontSize: subtitleFontSize, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              '• Our Mission:',
              style: TextStyle(
                fontSize: subtitleFontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We aim to empower businesses by building technology that not only solves problems but also drives growth. We believe in delivering value through smart, intuitive, and efficient software experiences.',
              style: TextStyle(fontSize: subtitleFontSize, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              '• What We Do:',
              style: TextStyle(
                fontSize: subtitleFontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '✓ Mobile App Development (Flutter, Android, iOS)\n'
              '✓ Web Development (Responsive and SEO-optimized)\n'
              '✓ Custom APIs and Backend Solutions (.NET, SQL Server)\n'
              '✓ Real-time Applications (SignalR, Firebase)\n'
              '✓ UI/UX Design & Branding',
              style: TextStyle(fontSize: subtitleFontSize, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              '• Why Choose Us:',
              style: TextStyle(
                fontSize: subtitleFontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '✔ Transparent communication and regular updates\n'
              '✔ Timely delivery and post-deployment support\n'
              '✔ Affordable pricing with high quality\n'
              '✔ Strong emphasis on UI/UX and performance\n'
              '✔ Deep domain knowledge and agile development methods',
              style: TextStyle(fontSize: subtitleFontSize, color: Colors.black),
            ),
          ],
        ),

        ///  Footer Section
        Footersection(),
      ],
    );
  }
}
