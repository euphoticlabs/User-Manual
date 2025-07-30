import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class DayToDayCleaning extends StatelessWidget {
  const DayToDayCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildImage(String url) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: ImageLoader(
          imagePath: url,
          width: imageWidth,
          height: 0,
          isNetwork: false,
        ),
      ),
    );

    Widget buildListItem(String text, {bool isBold = false}) => Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(text, style: TextStyle(fontSize: sectionFontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
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
                  'Day to Day cleaning',
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
              'Pan and Stirrer',
              style: TextStyle(
                fontSize: cardTitleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            buildListItem(
              '1. Soak within 30 mins after cooking to prevent residues from drying and sticking',
            ),
            buildListItem("2. Don't use metal spatulas, forks, knives, whisks", isBold: true),
            buildListItem('3. Avoid steel wool, scouring pads for cleaning', isBold: true),
            buildListItem('4. Use only sponge to clean'),
            buildListItem('5. Optionally you can wash in Dishwasher'),
            buildImage('${R.dayTodayCleaning}daytoday1.png'),
            const SizedBox(height: 24),
            Text(
              'Ingredients Tray',
              style: TextStyle(
                fontSize: cardTitleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
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
                        buildListItem(
                          '1. Soak within 30 mins after cooking to prevent residues from drying and sticking',
                        ),
                        buildListItem(
                          '2. Disassemble the tray and sliders as shown below',
                        ),
                        buildListItem(
                          '3. Use only sponge, microfiber cloth to clean',
                        ),
                        buildListItem(
                          '4. Make sure parts are dry before assembling and storing',
                        ),
                        buildListItem(
                          '4. Optionally you can wash in Dishwasher',
                        ),
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
              margin: const EdgeInsets.only(bottom: 24),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildListItem(
                          '1. Don’t use metal spatulas, forks, knives, whisks', isBold: true,
                        ),
                        buildListItem(
                          '2. Avoid steel wool, scouring pads for cleaning', isBold: true,
                        ),
                    
                      ],
                    ),
                  ),
                  ],
              ),
            ),
            
            const SizedBox(height: 24),
            Column(
              children: [
                buildImage('${R.dayTodayCleaning}daytoday2.png'),
                const SizedBox(height: 16),
                buildImage('${R.dayTodayCleaning}daytoday3.png'),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              'Inside the Device',
              style: TextStyle(
                fontSize: cardTitleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
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
                        buildListItem(
                          '1. Unplug the device before cleaning and performing maintenance.',
                        ),
                        buildListItem(
                          '2. Wipe the interior clean with a wet cloth',
                        ),
                        buildListItem(
                          '3. For tough residue you can use warm water and dish soap on cloth to wipe',
                        ),
                        buildListItem(
                          '4. Repeat this everyday to maintain device hygiene',
                        ),
                        buildListItem(
                          '5. Use disinfectant like Lizol Kitchen Cleaner Spray to clean inside surface',
                        ),
                        buildListItem(
                          '6. Use a kitchen tissue paper to wipe the camera glass clean',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                        buildListItem(
                          '1. Do not use harsh chemicals / detergents to clean the inside',
                          isBold: true,
                        ),
                        buildListItem(
                          '2. Avoid steel wool, scouring pads for cleaning', isBold: true,
                        ),
                        buildListItem(
                          '3. Do not directly spray water inside or outside the refrigerator.',
                          isBold: true,
                        ),
                        buildListItem(
                          '4. Do not spray cleaning products directly on the display.', isBold: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildImage('${R.dayTodayCleaning}daytoday4.png'),
            buildImage('${R.dayTodayCleaning}daytoday5.png'),
            buildImage('${R.dayTodayCleaning}daytoday6.png'),
            buildImage('${R.dayTodayCleaning}daytoday7.png'),
            buildImage('${R.dayTodayCleaning}daytoday8.png'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
