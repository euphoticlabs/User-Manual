
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class SensorsWidget extends StatelessWidget {
  const SensorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double stepImageHeight = screenWidth < 500 ? screenWidth * 0.5 : screenWidth * 0.5;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget stepImage(String url) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: ImageLoader(
              imagePath: url,
              width: stepImageWidth,
              height: stepImageHeight,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sensors',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child:stepImage('${R.sensors}sensors1.png'),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1.Camera\n2.IR temperature\n3.Camera glass\n4.Position inside device', style: TextStyle(fontSize: sectionFontSize, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          stepImage('${R.sensors}sensors2.png'),
          const SizedBox(height: 24),
          // Do's Card
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
                        "1. Camera glass should be clean for proper functioning of AI recipe",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
                    
                    ],
                  ),
                ),
                  
              ],
            ),
          ),
          const SizedBox(height: 16),
                      stepImage('${R.sensors}sensors3.png'),
        ],
      ),
      ),
    );
  }
} 