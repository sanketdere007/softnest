import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softnest/Pages/AboutPage.dart';
import 'package:softnest/Pages/CareerPage.dart';
import 'package:softnest/Pages/ContactPage.dart';
import 'package:softnest/Pages/FooterSection.dart';
import 'package:softnest/Pages/GalleryPage.dart';
import 'package:softnest/Pages/ServicePage.dart';
import 'Pages/HomePage.dart';
import 'Pages/LandingPage.dart';
import 'Pages/test.dart';

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => SharedLayout(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => LandingSection()),
        GoRoute(path: '/about', builder: (context, state) => AboutSection()),
        GoRoute(
            path: '/services', builder: (context, state) => ServicesSection()),
        GoRoute(
            path: '/gallery', builder: (context, state) => GallerySection()),
        GoRoute(path: '/career', builder: (context, state) => CareerSection()),
        GoRoute(
            path: '/contact', builder: (context, state) => ContactSection()),
      ],
    ),
  ],
);

void main() {
  runApp(SoftnestWebsite());
}

class SoftnestWebsite extends StatelessWidget {
  SoftnestWebsite({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      title: 'Softnest Technologies Private Limited',
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
