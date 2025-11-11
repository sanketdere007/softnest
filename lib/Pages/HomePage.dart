import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'FloatingWhatsAppButton.dart';

class SharedLayout extends StatefulWidget {
  final Widget child;
  const SharedLayout({super.key, required this.child});

  @override
  State<SharedLayout> createState() => _SharedLayoutState();
}

class _SharedLayoutState extends State<SharedLayout> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset > 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 65,
                color: const Color(0xFF262262),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Softnest',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    if (!isMobile)
                      Row(
                        children: [
                          _navItem(context, 'Home', '/'),
                          _navItem(context, 'About', '/about'),
                          _navItem(context, 'Services', '/services'),
                          _navItem(context, 'Gallery', '/gallery'),
                          _navItem(context, 'Career', '/career'),
                          _navItem(context, 'Contact', '/contact'),
                          // _navItem(context, 'Terms', '/terms'),
                        ],
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = true;
                          });
                        },
                      ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: widget.child,
                ),
              ),
            ],
          ),

          // ✅ Mobile Overlay Menu
          if (_isMenuOpen)
            Positioned.fill(
              child: Container(
                color: const Color(0xFF262262).withOpacity(0.9),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _overlayMenuItem(context, 'Home', '/'),
                          _overlayMenuItem(context, 'About', '/about'),
                          _overlayMenuItem(context, 'Services', '/services'),
                          _overlayMenuItem(context, 'Gallery', '/gallery'),
                          _overlayMenuItem(context, 'Career', '/career'),
                          _overlayMenuItem(context, 'Contact', '/contact'),
                          // _overlayMenuItem(context, 'Terms', '/terms'),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 32),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          //
          // // WhatsApp + Scroll To Top Button

          const FloatingWhatsAppButton(),

          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: Column(
          //     children: [
          //
          //       if (_showScrollToTopButton) const SizedBox(height: 10),
          //       if (_showScrollToTopButton)
          //         FloatingActionButton(
          //           onPressed: () {
          //             _scrollController.animateTo(0,
          //                 duration: const Duration(milliseconds: 500),
          //                 curve: Curves.easeOut);
          //           },
          //           backgroundColor: const Color(0xFF262262),
          //           child: const Icon(Icons.arrow_upward, color: Colors.white),
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _overlayMenuItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
        onPressed: () {
          setState(() {
            _isMenuOpen = false;
          });
          context.go(route);
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 17)),
    );
  }
}
