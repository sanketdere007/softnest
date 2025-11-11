import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footersection extends StatelessWidget {
  final double maxWidth;

  const Footersection({this.maxWidth = 1000});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;
    final isMobile = screen < 600;
    final itemStyle =
        TextStyle(color: Colors.grey[800], fontSize: isMobile ? 12 : 14);
    final headerStyle = TextStyle(
        color: Color(0xFF262262),
        fontWeight: FontWeight.bold,
        fontSize: isMobile ? 14 : 16);

    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(vertical: 24, horizontal: isMobile ? 16 : 48),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  _footerColumn(
                      "Shop",
                      [
                        "Groceries & Supermarket",
                        "Electronics & Appliances",
                        "Furniture & Home Decor",
                        "Mobile & Cameras",
                        "Sporting Goods",
                        "Fruits & Veggies",
                      ],
                      itemStyle,
                      headerStyle),
                  _footerColumn(
                      "Solutions",
                      [
                        "Bakery & Confectioneries",
                        "Bars & Breweries",
                        "Meat & Frozen Foods",
                        "FMCG & Packaged Foods",
                        "Lubricants",
                      ],
                      itemStyle,
                      headerStyle),
                  _footerColumn(
                      "Company",
                      [
                        "The Company",
                        "Become Partner",
                        "Contact Us",
                        "Delivery & Takeaways",
                        "Quick Service Restaurant",
                      ],
                      itemStyle,
                      headerStyle),
                  _footerColumn(
                      "Legal",
                      [
                        "Terms of Service",
                        "End of Licence Agreement",
                        "Refund & Cancellation Policy",
                        "Privacy Policy",
                      ],
                      itemStyle,
                      headerStyle,
                      onTapUrls: [
                        "https://agispares.com/#/terms",
                        "https://agispares.com/#/terms",
                        "https://agispares.com/#/privacy",
                        "https://agispares.com/#/refund",
                      ]),
                ],
              ),
              Divider(height: 40, color: Colors.grey[300]),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                children: [
                  _linkText("Support Agreement",
                      onTap: () => _launch("https://agispares.com/#/support")),
                  _linkText("Complain Procedure",
                      onTap: () => _launch("https://agispares.com/#/complain")),
                  _linkText("System Requirements",
                      onTap: () =>
                          _launch("https://agispares.com/#/requirements")),
                  _linkText("Support Price List",
                      onTap: () =>
                          _launch("https://agispares.com/#/price-list")),
                ],
              ),
              SizedBox(height: 24),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 24),
              if (isMobile)
                Column(
                  children: [
                    _contactRow(Icons.email, "support@yourdomain.com",
                        "mailto:support@yourdomain.com", itemStyle),
                    _contactRow(Icons.phone, "+91 8411837139",
                        "tel:+918411837139", itemStyle),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _contactRow(Icons.email, "support@softnest.com",
                        "mailto:support@softnest.com", itemStyle),
                    _contactRow(Icons.phone, "+91 8411837139",
                        "tel:+918411837139", itemStyle),
                  ],
                ),
              SizedBox(height: 16),
              Text(
                "© ${DateTime.now().year} SoftNest Technologies Private Limited. All rights reserved.",
                style: TextStyle(
                    color: Colors.grey[600], fontSize: isMobile ? 10 : 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerColumn(String header, List<String> items, TextStyle itemStyle,
      TextStyle headerStyle,
      {List<String>? onTapUrls}) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: headerStyle),
          SizedBox(height: 8),
          ...List.generate(items.length, (i) {
            final hasLink = onTapUrls != null && onTapUrls.length > i;
            return GestureDetector(
              onTap: hasLink ? () => _launch(onTapUrls[i]) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(items[i], style: itemStyle),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _linkText(String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text,
          style:
              TextStyle(color: Color(0xFF262262), fontWeight: FontWeight.w500)),
    );
  }

  Widget _contactRow(IconData icon, String text, String url, TextStyle style) {
    return GestureDetector(
      onTap: () => _launch(url),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: Color(0xFF262262), size: style.fontSize! + 4),
        SizedBox(width: 6),
        Text(text, style: style),
      ]),
    );
  }
}
