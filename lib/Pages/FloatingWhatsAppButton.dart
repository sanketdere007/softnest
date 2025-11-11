import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingWhatsAppButton extends StatefulWidget {
  const FloatingWhatsAppButton({super.key});

  @override
  State<FloatingWhatsAppButton> createState() => _FloatingWhatsAppButtonState();
}

class _FloatingWhatsAppButtonState extends State<FloatingWhatsAppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final String phoneNumber =
      '918411837139'; // Replace with your WhatsApp number

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: ScaleTransition(
        scale: _animation,
        child: GestureDetector(
          onTap: _launchWhatsApp,
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green[600],
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Image.asset(
              'assets/whatsapplogo.png', // Add a WhatsApp icon or your Softnest logo
              height: 50,
              width: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
