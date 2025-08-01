import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class LiquidWidget extends StatelessWidget {
  const LiquidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth =
        screenWidth < 500 ? screenWidth * 0.9 : screenWidth * 0.8;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget stepImage(String url, {double minWidth = 200, double minHeight = 150}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: minHeight,
          ),
          child: ImageLoader(
            imagePath: url,
            width: stepImageWidth,
            height: 0,
            isNetwork: false,
          ),
        ),
      ),
    );
    Widget liquidAssembly() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('1. Quick fill lid', style: TextStyle(fontSize: sectionFontSize)),
              Text('2. Container lid', style: TextStyle(fontSize: sectionFontSize)),
              Text('3. Container', style: TextStyle(fontSize: sectionFontSize)),
              Text('4. Level Marking', style: TextStyle(fontSize: sectionFontSize)),
              Text('5. Mesh filter', style: TextStyle(fontSize: sectionFontSize)),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: stepImage('${R.liquid}liquid1.png', minWidth: 280, minHeight: 350),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oil and Water',
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
          liquidAssembly(),
          const SizedBox(height: 24),
          Text(
            'Removing the container',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          stepImage('${R.liquid}liquid2.png', minWidth: 320, minHeight: 240),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text('1. Inlet pipe is removable', style: TextStyle(fontSize: sectionFontSize)),
             Text('2. Mesh filter is removable', style: TextStyle(fontSize: sectionFontSize)),
             Text('3. Lid can be removed with extended tab behind the container', style: TextStyle(fontSize: sectionFontSize)),


            ],
          ),
          const SizedBox(height: 24),
          stepImage('${R.liquid}liquid3.png', minWidth: 300, minHeight: 200),
          const SizedBox(height: 32),
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
              Text('1. Align the container  to platform as shown alongside', style: TextStyle(fontSize: sectionFontSize)),
              Text('2. Insert the SS pipe and press to lock it in place', style: TextStyle(fontSize: sectionFontSize)),
              Text('3. Push the container inside', style: TextStyle(fontSize: sectionFontSize)),
              Text('4. Similarly you can remove water container also', style: TextStyle(fontSize: sectionFontSize)),

            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(flex: 1, child: Padding(padding: const EdgeInsets.only(top: 16.0), child: stepImage('${R.liquid}liquid4.png', minWidth: 150, minHeight: 180),)),
              Expanded(flex: 2, child: Padding(padding: const EdgeInsets.only(bottom: 16.0), child: stepImage('${R.liquid}liquid5.png', minWidth: 250, minHeight: 200),)),
            ],
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.liquid}liquid6.png', minWidth: 280, minHeight: 220),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.liquid}liquid7.png', minWidth: 280, minHeight: 240),),
          const SizedBox(height: 32),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0), child: stepImage('${R.liquid}liquid8.png', minWidth: 280, minHeight: 200),),
        
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
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style.copyWith(fontSize: sectionFontSize),
                          children: const [
                            TextSpan(text: '1. Insert labeled pipe in respective container '),
                            TextSpan(
                              text: '( yellow ‘O’ indicator for oil )',
                              style: TextStyle(color: Color(0xFFFF6B2C), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "2. Make sure oil container is completely dry before refilling",
                        style: TextStyle(fontSize: sectionFontSize),
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
                // Don'ts
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
                      Text("1. Do not use oils that solidify at your room temperature", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0))),
                      Text("2. Never put used oil into the container.", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0))),
                      Text("3. Avoid mustard oil; it may harm the machine.", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0))),
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
