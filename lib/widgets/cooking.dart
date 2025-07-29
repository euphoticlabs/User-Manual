import 'package:flutter/material.dart';

class CookingWidget extends StatelessWidget {
  const CookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildListItem(String text, {int? number, bool isBold = false}) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (number != null)
                Text("$number. ", style: TextStyle(fontSize: sectionFontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: sectionFontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
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
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(212, 255, 223, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "✅ Do’s",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: cardTitleFontSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
                ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0EC),
              borderRadius: BorderRadius.circular(16),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "❌ Don’ts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: cardTitleFontSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildListItem('Don’t use metal spatulas, forks, knives, whisks, etc. for stirring or mixing',
                          number: 1, isBold: true),
                      buildListItem('Do not put more / less ingredients other than the specified amount mentioned in recipe',
                          number: 2, isBold: true),
                      buildListItem('Avoid steel wool, scouring pads for cleaning',
                          number: 3, isBold: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ],
            ),
          ),
          const SizedBox(height: 24),
          
        ],
      ),
      ),
    );
  }
} 