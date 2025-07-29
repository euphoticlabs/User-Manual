
import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildListItem(
      String text, {
      bool isNumbered = false,
      int number = 0,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isNumbered ? "$number. " : "",
            style: TextStyle(fontSize: sectionFontSize),
          ),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: sectionFontSize)),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '📞 Contact Information',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Customer Support: 1800 106 202', isNumbered: false),
          buildListItem('Email: support@nosh.com', isNumbered: false),
          buildListItem('Website: www.nosh.com', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '🕒 Support Hours',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Monday to Friday: 9:00 AM - 6:00 PM', isNumbered: false),
          buildListItem('Saturday: 10:00 AM - 4:00 PM', isNumbered: false),
          buildListItem('Sunday: Closed', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '🔧 Technical Support',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('For troubleshooting assistance', isNumbered: false),
          buildListItem('For warranty claims', isNumbered: false),
          buildListItem('For spare parts inquiries', isNumbered: false),
          buildListItem('For installation support', isNumbered: false),

          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
