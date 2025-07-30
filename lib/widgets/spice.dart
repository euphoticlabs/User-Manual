import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class SpiceWidget extends StatelessWidget {
  const SpiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // You can tweak these breakpoints and scaling factors as needed
    double imageWidth = screenWidth < 500 ? 189.0 :screenWidth * 0.35;
    double imageWidth2 = screenWidth < 500 ? 213.0 : screenWidth * 0.4;
    double imageHeight = screenWidth < 500 ? 273.0 : screenWidth * 0.4;
    double imageHeight2 = screenWidth < 500 ? 273.0 : screenWidth * 0.4;
    double stepImageWidth = screenWidth < 500 ? screenWidth * 0.8 : screenWidth * 0.8;
    double stepImageHeight = screenWidth < 500 ? screenWidth * 0.5 : screenWidth * 0.5;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget spiceAssembly() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: imageWidth,
              child: ImageLoader(
                imagePath: '${R.spice}spice1.png',
                width: imageWidth,
                height: imageHeight,
                isNetwork: false,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1. Lid', style: TextStyle(fontSize: sectionFontSize)),
                Text('2. Knob', style: TextStyle(fontSize: sectionFontSize)),
                Text('3. Tray', style: TextStyle(fontSize: sectionFontSize)),
                Text('4. Spice label / number', style: TextStyle(fontSize: sectionFontSize)),
              ],
              ),
            ),
          ],
        );

    Widget spiceContainer() => Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('5. Cap', style: TextStyle(fontSize: sectionFontSize)),
                  Text('6. Dispensing mechanism', style: TextStyle(fontSize: sectionFontSize)),
                  Text('7. Refill / full indicator', style: TextStyle(fontSize: sectionFontSize)),
                  Text('8. Lock / Unlock indicator', style: TextStyle(fontSize: sectionFontSize)),
                ],
              ),
            ),
            const SizedBox(width: 32),
            SizedBox(
              width: imageWidth2,
              child: ImageLoader(
                imagePath: '${R.spice}spice2.png',
                width: imageWidth2,
                height: imageHeight2,
                isNetwork: false,
              ),
            ),
          ],
        );

    Widget stepImage(String url) => Padding(
          padding: EdgeInsets.zero,
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
                'Spice',
                style: TextStyle(
                  color: const Color(0xFFFF6B2C),
                  fontSize: titleFontSize,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          spiceAssembly(),
          const SizedBox(height: 16),
          spiceContainer(),
          const SizedBox(height: 24),
          Text(
            'Removing the Container',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: sectionFontSize + 2),
          ),
          stepImage('${R.spice}spice3.png'),
          const SizedBox(height: 24),
          Text(
            'Inserting the Container',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: sectionFontSize + 2),
          ),
          stepImage('${R.spice}spice4.png'),
          stepImage('${R.spice}spice5.png'),
          stepImage('${R.spice}spice6.png'),
          const SizedBox(height: 32),
          Text(
            'Remove from / Insert into device',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: sectionFontSize + 2),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Remove the transparent spice lid', style: TextStyle(fontSize: sectionFontSize)),
              Text('2. Use the wooden knob to lift the tray out or insert it back', style: TextStyle(fontSize: sectionFontSize)),
              Text('3. Reverse the steps for inserting', style: TextStyle(fontSize: sectionFontSize)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '4. For cleaning refer ', style: TextStyle(fontSize: sectionFontSize)),
                    TextSpan(
                      text: 'Cleaning',
                      style: TextStyle(
                        color: const Color(0xFFFF6B2C),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: sectionFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Center(
            child: ImageLoader(
              imagePath: '${R.spice}spice7.png',
              width: 324,
              height: 407,
              isNetwork: false,
            ),
          ),
          const SizedBox(height: 32),

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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1. ", style: TextStyle(fontSize: sectionFontSize)),
                          Expanded(
                            child: Text("Check spice levels and any clogging weekly, and top up the container to the \"Full\" level.", style: TextStyle(fontSize: sectionFontSize)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2. ", style: TextStyle(fontSize: sectionFontSize)),
                          Expanded(
                            child: Text("Assemble the containers so that their numbers match those marked on the tray.", style: TextStyle(fontSize: sectionFontSize)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3. ", style: TextStyle(fontSize: sectionFontSize)),
                          Expanded(
                            child: Text("Upon correct assembly, the line on each container will align with the line on the tray.", style: TextStyle(fontSize: sectionFontSize)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4. ", style: TextStyle(fontSize: sectionFontSize)),
                          Expanded(
                            child: Text("Wash the container under running water using dish soap and a sponge.", style: TextStyle(fontSize: sectionFontSize)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5. ", style: TextStyle(fontSize: sectionFontSize)),
                          Expanded(
                            child: Text("Ensure the container is completely dry before refilling.", style: TextStyle(fontSize: sectionFontSize)),
                          ),
                        ],
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
                Text("❌ Don’ts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: cardTitleFontSize)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. Do not put the container inside dishwasher", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold)),
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
