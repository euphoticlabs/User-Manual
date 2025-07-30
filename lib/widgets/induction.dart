
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Induction',
                      style: TextStyle(
                        color: const Color(0xFFFF6B2C),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side - Image
                    SizedBox(
                      width: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                      child: ImageLoader(
                        imagePath: '${R.induction}induction1.png',
                        width: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                        height: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                        isNetwork: false,
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Right side - Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1. Top ceramic glass', style: TextStyle(fontSize: sectionFontSize)),
                          Text('2. Pan Aligner', style: TextStyle(fontSize: sectionFontSize)),
                          Text('3. Induction enclosure', style: TextStyle(fontSize: sectionFontSize)),
                          const SizedBox(height: 24),
                          SizedBox(
                      width: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ImageLoader(
                        imagePath: '${R.induction}induction2.png',
                        width: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                        height: screenWidth < 500 ? screenWidth * 0.4 : screenWidth * 0.35,
                        isNetwork: false,
                      ),
                    ),
                    ),
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
              color: const Color.fromRGBO(212, 255, 223, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Do's
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
                const SizedBox(height: 20),
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
              
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 240, 238, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Don'ts
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "1.The surface of induction glass is hot after cooking, Do not touch.\n2.Do not splash water near induction enclosure area\n3.Do not pour water to clean the ceramic glass surface",
                          style: TextStyle(fontSize: sectionFontSize, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
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