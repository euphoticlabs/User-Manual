import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class FourMonthsCleaning extends StatelessWidget {
  const FourMonthsCleaning({super.key});

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
            child: CachedNetworkImage(
              imageUrl: url,
              width: width ?? imageWidth,
              fit: BoxFit.contain,
            ),
          ),
        );

    Widget buildListItem(String text, {bool isNumbered = false, int number = 0}) =>
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isNumbered ? "$number. " : "• ",
                  style: TextStyle(fontSize: sectionFontSize)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: sectionFontSize)),
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
                  buildListItem(
                      'Avoid steel wool, scouring pads for cleaning',
                      isNumbered: true,
                      number: 1),
                  buildListItem('Do not put containers in dishwasher',
                      isNumbered: true, number: 2),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Every 4 Months cleaning',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Oil water pipe cleaning',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Remove Oil / Water container for cleaning', isNumbered: true, number: 1),
          buildListItem('Place a big bowl with mixture of ¼ tbsp baking soda in a litre of water', isNumbered: true, number: 2),
          buildListItem('Insert oil water pipe into the container', isNumbered: true, number: 3),
          buildListItem('Connect drain pipe to both nozzle and keep in the bowl', isNumbered: true, number: 4),
          buildListItem('Tap on clean water', isNumbered: true, number: 5),
          buildListItem('Device circulates water in the water system for 5 min', isNumbered: true, number: 6),
          buildListItem('Tap on clean oil', isNumbered: true, number: 7),
          buildListItem('Device circulates water in the oil system for 5 min', isNumbered: true, number: 8),
          buildListItem('Meanwhile clean the oil water container and keep for drying', isNumbered: true, number: 9),
          buildListItem('Throw contents of bowl and place a bowl with fresh water', isNumbered: true, number: 10),
          buildListItem('Tap clean water to rinse for 5 min', isNumbered: true, number: 11),
          buildListItem('Tap clean oil to rinse', isNumbered: true, number: 12),
          buildListItem('Throw the contents of the bowl and place the bowl near nozzle of cooking chamber', isNumbered: true, number: 13),
          buildListItem('Oil container needs drying ( can be wiped dry with tissue )', isNumbered: true, number: 14),
          buildListItem('Wipe the SS pipe free of any residual water', isNumbered: true, number: 15),
          buildListItem('Fill the container with water and oil', isNumbered: true, number: 16),
          buildListItem('Place the container inside the device', isNumbered: true, number: 17),
          buildListItem('Dispense slight amount of water and oil into the bowl', isNumbered: true, number: 18),
          buildListItem('Message telling user to repeat every 4 months', isNumbered: true, number: 19),
          const SizedBox(height: 8),
          buildDonts(),
          const SizedBox(height: 24),

          Text(
            'Platform cleaning',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Hold the device from front as shown below', isNumbered: true, number: 1),
          buildListItem('Lift the front and move around', isNumbered: true, number: 2),
          const SizedBox(height: 8),
          buildImage('${R.fourMonthsCleaning}monthly_4e1.png'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
} 