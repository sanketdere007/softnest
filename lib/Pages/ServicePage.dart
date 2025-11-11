import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  final services = const [
    {'title': 'Web Development', 'icon': Icons.web},
    {'title': 'Mobile App Development', 'icon': Icons.phone_android},
    {'title': 'UI/UX Design', 'icon': Icons.design_services},
    {'title': 'SEO Optimization', 'icon': Icons.trending_up},
    {'title': 'Cloud Solutions', 'icon': Icons.cloud},
    {'title': 'Maintenance', 'icon': Icons.build},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    double titleFontSize = isMobile
        ? 16
        : isTablet
            ? 18
            : 20;
    EdgeInsetsGeometry padding = isMobile
        ? EdgeInsets.all(16)
        : isTablet
            ? EdgeInsets.symmetric(horizontal: 32, vertical: 24)
            : EdgeInsets.symmetric(horizontal: 64, vertical: 32);

    return Container(
      color: Colors.grey.shade100,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Services',
            style: TextStyle(
              fontSize: titleFontSize + 8,
              fontWeight: FontWeight.bold,
              color: Color(0xFF262262),
            ),
          ),
          SizedBox(height: 24),

          // Layout Switcher
          isMobile
              ? SizedBox(
                  height: 75,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return _buildServiceCard(service, titleFontSize,
                          width: 250);
                    },
                  ),
                )
              : GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: isTablet ? 2 : 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3,
                  physics: NeverScrollableScrollPhysics(),
                  children: services
                      .map((service) =>
                          _buildServiceCard(service, titleFontSize))
                      .toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service, double fontSize,
      {double? width}) {
    return HoverAnimatedCard(
      title: service['title'] as String,
      icon: service['icon'] as IconData,
      fontSize: fontSize,
      width: width,
    );
  }
}

class HoverAnimatedCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final double fontSize;
  final double? width;

  const HoverAnimatedCard({
    super.key,
    required this.title,
    required this.icon,
    required this.fontSize,
    this.width,
  });

  @override
  State<HoverAnimatedCard> createState() => _HoverAnimatedCardState();
}

class _HoverAnimatedCardState extends State<HoverAnimatedCard> {
  bool _isHovered = false;

  @override
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Transform.scale(
        scale: _isHovered ? 1.03 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: _isHovered ? 20 : 8,
                offset: Offset(0, _isHovered ? 20 : 4),
              ),
            ],
          ),
          width: widget.width,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(widget.icon,
                  size: widget.fontSize + 6, color: const Color(0xFF262262)),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
