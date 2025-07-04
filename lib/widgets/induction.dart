
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class InductionWidget extends StatelessWidget {
  const InductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget stepImage(String url) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: ImageLoader(
              imagePath: url, 
              width: stepImageWidth,
              height: stepImageWidth,
              isNetwork: false,
            ),
          ),
        );
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Induction',
                  style: TextStyle(
                    color: const Color(0xFFFF6B2C),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          stepImage('${R.induction}induction1.png'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          Text('1. Top ceramic glass',
                              style: TextStyle(fontSize: sectionFontSize)),
                          Text('2. Bumpons',
                              style: TextStyle(fontSize: sectionFontSize)),
                          Text('3. Coil enclosure',
                              style: TextStyle(fontSize: sectionFontSize)),
                          stepImage('${R.induction}induction2.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          
          const SizedBox(height: 24),
          // Do's and Don'ts Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0EC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Do's
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
                      Text(
                        "1. Follow cleaning instruction",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Don'ts
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
                      Text(
                          "1. The surface of induction glass is hot after cooking, Do not touch.",
                          style: TextStyle(fontSize: sectionFontSize)),
                      const SizedBox(height: 4),
                      Text("2. Do not splash water near induction coil area",
                          style: TextStyle(fontSize: sectionFontSize)),
                      const SizedBox(height: 4),
                      Text("3. Do not pour water to clean the surface",
                          style: TextStyle(fontSize: sectionFontSize)),
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