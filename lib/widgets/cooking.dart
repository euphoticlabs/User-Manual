import 'package:flutter/material.dart';

class CookingWidget extends StatelessWidget {
  const CookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildListItem(String text, {int? number}) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (number != null)
                Text("$number. ", style: TextStyle(fontSize: sectionFontSize)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: sectionFontSize)),
              ),
            ],
          ),
        );

    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cooking',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '🍳 General guidelines for cooking',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0EC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_box, color: Colors.green, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      "Do's",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: cardTitleFontSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildListItem('Follow precise style of cooking',
                          number: 1),
                      buildListItem(
                          'Measure and put in Ingredients Tray as per instructions',
                          number: 2),
                      buildListItem(
                          'Use recommended brands for ingredients wherever mentioned for best outcome',
                          number: 3),
                      buildListItem(
                          'Some recipes are highly dependent on ingredients',
                          number: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.close, color: Colors.red, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      "Don'ts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: cardTitleFontSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildListItem(
                          'Swapping or removal of ingredients should be avoided unless mentioned specifically',
                          number: 1),
                      buildListItem(
                          'Do not put more / less ingredients other than the specified amount mentioned in recipe',
                          number: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
} 