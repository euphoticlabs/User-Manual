import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class CabinetInstallation extends StatelessWidget {
  const CabinetInstallation({super.key});

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

    
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cabinet Installation',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '📎 Changing exhaust duct',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Pull the old chimney duct out', isNumbered: true, number: 1),
          buildListItem('Put the new chimney duct compatible with ducting pipe', isNumbered: true, number: 2),
          buildListItem('Push the duct cap into place', isNumbered: true, number: 3),

          const SizedBox(height: 8),
         Padding(padding: const EdgeInsets.symmetric(horizontal: 100.0), child: buildImage('${R.cabinetInstallation}cabinet_installation1.png')),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.all(0), child: buildImage('${R.cabinetInstallation}cabinet_installation2.png')),
          const SizedBox(height: 16),
          Text(
            '📐 Kitchen requirements',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Minimum cabinet dimension X*Y*Z', isNumbered: true, number: 1),
          buildListItem('The cabinet should be op  en without any doors', isNumbered: true, number: 2),
          buildListItem('If door are present adequate ventilation has to be ensured for proper functioning of the device', isNumbered: true, number: 3),
          buildListItem('Use a clamp to fasten the duct on duct cap', isNumbered: true, number: 4),
          buildImage('${R.cabinetInstallation}cabinet_installation3.png'),
           const SizedBox(height: 16),
          Text(
            '🔨 Installation',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Install the chimney duct to the main ducting using a Y connector', isNumbered: true, number: 1),
          buildImage('${R.cabinetInstallation}cabinet_installation4.png'),
           const SizedBox(height: 16),
         ],
      ),
      ),
    );
  }
} 