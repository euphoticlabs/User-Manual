
import 'package:flutter/material.dart';

class Reference extends StatelessWidget {
  const Reference({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reference',
                style: TextStyle(
                  color: const Color(0xFFFF6B2C),
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            '🍳 Compatible list of Oils',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'You can use any cooking oil, except:',
            style: TextStyle(
              fontSize: sectionFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          buildListItem('a. Oils that solidify at room temperature (e.g., ghee, butter, coconut oil)', isNumbered: false),
          buildListItem('b. Oils with low smoke points (e.g., virgin, cold-pressed, or unrefined oils)', isNumbered: false),
          buildListItem('c. Oils with strong odors (e.g., mustard oil)', isNumbered: false),
          ],
          ),),

          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
