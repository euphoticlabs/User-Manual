import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class TrayWidget extends StatelessWidget {
  const TrayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double stepImageWidth = screenWidth < 500 ? screenWidth * 0.8 : screenWidth * 0.8;
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
    Widget ingredientsAssembly() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stepImage('${R.ingredients}tray1.png'),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('1. Tray', style: TextStyle(fontSize: sectionFontSize)),
              Text(
                '2. Slider (removable)',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '3. Label graphics',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '4. Slot number indicative',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
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
            'Ingredients',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ingredientsAssembly(),
          const SizedBox(height: 24),
          Text(
            'Inserting the slider',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          stepImage('${R.ingredients}tray2.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '1. Insert the slider from the curved side of the tray',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '2. Align the profile as shown alongside',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '3. Push the slider completely, the curved side of tray matches with curved side of slider',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Removing the slider',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sectionFontSize + 2,
            ),
          ),
          stepImage('${R.ingredients}tray3.png'),
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
              Text(
                '1. Align tray to platform as shown alongside',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '2. Insert and press to lock it place',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '3. You will hear a feedback upon successful insertion',
                style: TextStyle(fontSize: sectionFontSize),
              ),
            ],
          ),
          const SizedBox(height: 24),
          stepImage('${R.ingredients}tray4.png'),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4. To remove the tray press the eject button (highlighted alongside)',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text(
                '5. The tray pops out',
                style: TextStyle(fontSize: sectionFontSize),
              ),
              Text('6. You can pull the tray out', style: TextStyle(fontSize: sectionFontSize)),

            ],
          ),
          const SizedBox(height: 24),
          stepImage('${R.ingredients}tray5.png'),
          const SizedBox(height: 32),
          stepImage('${R.ingredients}tray6.png'),
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
                        "1. Make sure all the sliders are completely inserted",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "2. Change the tray after every 1000 cooking / 1 year",
                        style: TextStyle(fontSize: sectionFontSize),
                      ),
                      const SizedBox(height: 4),
                      stepImage('${R.ingredients}tray7.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                      Text("1. Do not use a lot of force on the eject button", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold)),
                      Text("2. Do not insert slider from top", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold)),
                      Text("3. Do not press eject button while dispensing is happening", style: TextStyle(fontSize: sectionFontSize, fontWeight: FontWeight.bold)),
                      stepImage('${R.ingredients}tray8.png'),
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
