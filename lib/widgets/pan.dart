import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class PanWidget extends StatelessWidget {
  const PanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double stepImageHeight = screenWidth < 500 ? screenWidth * 0.5 : screenWidth * 0.5;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
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
    Widget panAssembly() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '1. Ceramic coating',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '2. 3.5 L capacity',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: stepImage('${R.pan}pan1.png'),
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
            'Pan',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          panAssembly(),
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
                '1. Slide the Pan inside as shown below',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '2. Make sure inner handle is inserted to holding area as shown below',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '3. To remove, you can pull the pan using the handle and slide onto door',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: stepImage('${R.pan}pan2.png'),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: stepImage('${R.pan}pan3.png'),
          ),
          const SizedBox(height: 32),
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
                        "1. Only use the Pan provided by Nosh, using other pans may cause physical damage to the product",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
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
