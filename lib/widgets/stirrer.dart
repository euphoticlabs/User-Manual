import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class StirrerWidget extends StatelessWidget {
  const StirrerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;

    Widget stepImage(String url) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: url,
          width: stepImageWidth,
          fit: BoxFit.contain,
        ),
      ),
    );
    Widget stirrerAssembly() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('1.Silicone', style: TextStyle(fontSize: sectionFontSize)),
              Text('2.Holder', style: TextStyle(fontSize: sectionFontSize)),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: stepImage('${R.stirrer}stirrer1.png'),
            ),
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
            'Stirrer',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          stirrerAssembly(),
          const SizedBox(height: 24),
          Text(
            'Remove from / Insert into device',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Align slider on the shaft',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '2. Notice the D shape on shaft and stirrer holder',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '3. Insert onto shaft by moving up, stirrer magnetically attaches',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: stepImage('${R.stirrer}stirrer2.png'),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: stepImage('${R.stirrer}stirrer3.png'),
          ),
          const SizedBox(height: 32),
        ],
      ),
      ),
    );
  }
}
