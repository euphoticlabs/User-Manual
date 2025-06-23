import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class ChimneyWidget extends StatelessWidget {
  const ChimneyWidget({super.key});

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
        child: CachedNetworkImage(
          imageUrl: url,
          width: stepImageWidth,
          fit: BoxFit.contain,
        ),
      ),
    );
    Widget chimneyAssembly() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('1. Mesh filter', style: TextStyle(fontSize: sectionFontSize)),
              Text('2. Exhaust frame', style: TextStyle(fontSize: sectionFontSize)),
              Text('3. Oil collection area', style: TextStyle(fontSize: sectionFontSize)),
              Text('4. Knob', style: TextStyle(fontSize: sectionFontSize)),

            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: stepImage('${R.chimney}chimney1.png'),
            ),
          ),
        ],
      ),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chimney',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          chimneyAssembly(),
          const SizedBox(height: 24),
          Text(
            'Removing mesh filter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text('1. Pull the filter out holding the knob area', style: TextStyle(fontSize: sectionFontSize)),
             Text('2. Keep it upright to avoid oil spilling', style: TextStyle(fontSize: sectionFontSize)),
             Text('3. To insert back push it all the way into the slot', style: TextStyle(fontSize: sectionFontSize)),



            ],
          ),
          stepImage('${R.chimney}chimney2.png'),
          const SizedBox(height: 24),
          stepImage('${R.chimney}chimney3.png'),
          const SizedBox(height: 32),
          stepImage('${R.chimney}chimney4.png'),
          Text(
            'Changing exhaust direction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('1. Pull the chimney duct out', style: TextStyle(fontSize: sectionFontSize)),
            Text('2. Rotate the duct facing either left or right depending on your kitchen', style: TextStyle(fontSize: sectionFontSize)),
            Text('3. Push the duct cap into place', style: TextStyle(fontSize: sectionFontSize)),


            ],
          ),
          const SizedBox(height: 24),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.chimney}chimney5.png'),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.chimney}chimney6.png'),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.chimney}chimney7.png'),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.chimney}chimney8.png'),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.chimney}chimney9.png'),),
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
                // Do's
                Row(
                  children: [
                    const Icon(Icons.check_box, color: Colors.green, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      "Do's",
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
                        "1.Clean the chimney filter every 1 months / xx cookings",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
