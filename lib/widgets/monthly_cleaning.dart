
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class MonthlyCleaning extends StatelessWidget {
  const MonthlyCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildImage(String url, {double? width}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: ImageLoader(
              imagePath: url,
              width: width ?? imageWidth,
              height: width ?? imageWidth,
              isNetwork: false,
            ),
          ),
        );

    Widget buildListItem(String text, {bool isNumbered = false, int number = 0, bool isBold = false}) => Padding(
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

    Widget buildDosAndDonts(
        {String title = '',
         List<String> dos = const [],
        List<String> donts = const []}) {
      return Column(
        children: [
          // Do's Container
          if (dos.isNotEmpty)
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
                        "✅ Do's",
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
                      children: List.generate(
                          dos.length,
                          (index) => buildListItem(dos[index],
                              isNumbered: true, number: index + 1)),
                    ),
                  ),
                ],
              ),
            ),
          // Don'ts Container
          if (donts.isNotEmpty)
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
                        "❌ Don'ts",
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
                      children: List.generate(
                          donts.length,
                          (index) => buildListItem(donts[index],
                              isNumbered: true, number: index + 1, isBold: true)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly cleaning',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Spice Section
          Text(
            'Spice',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildDosAndDonts(
            title: 'Spice',
            dos: [
              'Remove and wash the container individually',
              'If required use dish soap and rinse thoroughly',
              'Rotate the bottom star disc to remove spice residue inside mechanism',
            ],
          
          ),
          buildImage('${R.monthlyCleaning}monthly1.png'),
          buildDosAndDonts(
             donts: [
              'Avoid steel wool, scouring pads for cleaning',
            ],
          ),
          const SizedBox(height: 24),
          // Oil & Water Section
          Text(
            'Oil & Water',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildDosAndDonts(
            title: 'Oil & Water',
            dos: [
              'Remove and wash the container individually',
              'Use dish soap with sponge and rinse thoroughly',
              'Dry the containers before refilling',
              'Water containers can be cleaned similarly',
              'Containers can be washed in dishwasher',
            ],
          ),
          buildImage('${R.monthlyCleaning}monthly2.png'),
          buildDosAndDonts(
            donts: [
              'Do not use plastic or steel scrub to clean',
            ],
          ),
          const SizedBox(height: 24),

          // Chimney Filter Section
          Text(
            'Chimney Filter',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildDosAndDonts(
            dos: [
              'Remove the  chimney filter',
              'If too much clogged put the filter in a large enough bowl containing citric acid powder, vinegar and water',
              'Leave the filter in the solution for 15 mins',
              'Rinse thoroughly',
              'Dry before installing the filter',
            ],
          ),
          const SizedBox(height: 16),
          
          buildImage('${R.monthlyCleaning}monthly3.png'),
          buildDosAndDonts(
            donts: [
              'Do not wash in dishwasher'
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Spice Area',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 28),
          buildListItem(
            'Remove the spice tray',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Any spice spillage can be wiped using dry cloth into the cooking area through dispensing area shown below',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Additionally you can place the pan inside the device to collect the falling spice',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Make sure no debris goes into the sensor area',
            isNumbered: true,
            number: 4,
            isBold: true,
          ),
          const SizedBox(height: 16),
          buildImage('${R.monthlyCleaning}monthly4.png'),
          buildImage('${R.monthlyCleaning}monthly5.png'),
          buildImage('${R.monthlyCleaning}monthly6.png'),
        ],
      ),
      ),
    );
  } 
}