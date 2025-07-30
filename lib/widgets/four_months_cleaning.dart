
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class FourMonthsCleaning extends StatelessWidget {
  const FourMonthsCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double stepImageHeight = screenWidth < 500 ? screenWidth * 0.5 : screenWidth * 0.5;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildImage(String url, {double? width}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: ImageLoader(
              imagePath: url,
              width: width ?? imageWidth,
              height: stepImageHeight,
              isNetwork: false,
            ),
          ),
        );

    Widget buildListItem(String text, {bool isNumbered = false, int number = 0, bool isBold = false}) =>
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isNumbered ? "$number. " : "• ",
                  style: TextStyle(fontSize: sectionFontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: sectionFontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
              ),
            ],
          ),
        );

    Widget buildDonts() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
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
                
                Text(
                  "❌ Don’ts",
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
                        'Avoid steel wool, scouring pads for cleaning',
                      isNumbered: true,
                      number: 1,
                      isBold: true),
                  buildListItem('Do not put containers in dishwasher',
                      isNumbered: true, number: 2, isBold: true),
                ],
              ),
            ),
          ],
        ),
      );
    }

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
                'Every 4 Months cleaning',
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
          Text(
            'Oil water pipe cleaning',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. ",
                    style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.normal)),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.normal, color: Colors.black),
                      children: const [
                        TextSpan(text: 'On device screen, Go to '),
                        TextSpan(
                          text: 'Settings > Cleaning > Oil Water Cleaning',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' Follow the on screen instructions'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildListItem('Follow the on screen instructions', isNumbered: true, number: 2, isBold: false),
          const SizedBox(height: 30),
          buildDonts(),
          const SizedBox(height: 24),

          Text(
            'Platform cleaning',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('Hold the device from front as shown below', isNumbered: true, number: 1),
          buildListItem('Lift the front and move around', isNumbered: true, number: 2),
          const SizedBox(height: 30),
          buildImage('${R.fourMonthsCleaning}monthly_4e1.png'),
          const SizedBox(height: 16),
        ],
      ),
      ),
    );
  }
} 