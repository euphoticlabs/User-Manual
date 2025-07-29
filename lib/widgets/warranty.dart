
import 'package:flutter/material.dart';

class Warranty extends StatelessWidget {
  const Warranty({super.key});

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
            isNumbered ? "$number. " : "• ",
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
            'Warranty',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '📋 Warranty Terms',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Standard warranty period: 2 years from date of purchase', isNumbered: false),
          buildListItem('Extended warranty available for additional coverage', isNumbered: false),
          buildListItem('Warranty covers manufacturing defects and faulty components', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '❌ What\'s Not Covered',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Damage due to misuse or improper installation', isNumbered: false),
          buildListItem('Normal wear and tear of consumable parts', isNumbered: false),
          buildListItem('Damage from power surges or electrical issues', isNumbered: false),
          buildListItem('Cosmetic damage or scratches', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '✅ Warranty Claims',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Contact customer support with proof of purchase', isNumbered: false),
          buildListItem('Provide device serial number and issue description', isNumbered: false),
          buildListItem('Authorized service center repairs only', isNumbered: false),
          buildListItem('Free shipping for warranty repairs', isNumbered: false),

          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
