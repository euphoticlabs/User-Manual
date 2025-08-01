
import 'package:flutter/material.dart';

class FirstAid extends StatelessWidget {
  const FirstAid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double cardTitleFontSize = screenWidth < 500 ? 16 : 20;

    Widget buildListItem(
      String text, {
      bool isNumbered = false,
      int number = 0,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isNumbered ? "$number. " : "• ",
            style: TextStyle(fontSize: sectionFontSize),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'First Aid & Medical Assistance',
                style: TextStyle(
                  color: const Color(0xFFFF6B2C),
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'In case of accidental injury during the use or maintenance of your Nosh device, follow these first aid guidelines and seek medical help when necessary:',
            style: TextStyle(
              fontSize: sectionFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          
          Text(
            '🔥 Burns (from hot surfaces or steam)',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Immediately move away from the source of heat', isNumbered: false),
          buildListItem('Cool the affected area under clean, running water for at least 10 minutes', isNumbered: false),
          buildListItem('Do not apply oils, butter, or unapproved creams', isNumbered: false),
          buildListItem('Cover the area with a sterile, non-adhesive bandage', isNumbered: false),
          buildListItem('Seek medical help if the burn is larger than a coin, blisters form, or the pain persists', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '⚡ Electrical Shock',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Do not touch the injured person if the device is still connected to power. Unplug the appliance first', isNumbered: false),
          buildListItem('If the person is unconscious, call emergency services immediately', isNumbered: false),
          buildListItem('If trained, begin CPR if the person is unresponsive and not breathing', isNumbered: false),
          buildListItem('Seek medical attention even if symptoms seem mild (e.g., numbness, weakness, confusion)', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '🔪 Cuts or Pinching Injuries (from moving parts or sharp edges)',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('Stop any bleeding by applying gentle pressure with a clean cloth', isNumbered: false),
          buildListItem('Clean the wound with water and apply an antiseptic', isNumbered: false),
          buildListItem('Cover with a sterile bandage', isNumbered: false),
          buildListItem('Seek medical attention if the cut is deep, bleeding doesn\'t stop, or there is visible deformity or swelling', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '🦠 Exposure to Contaminated or Spoiled Food',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('If nausea, vomiting, or discomfort occurs after consuming food, hydrate and rest', isNumbered: false),
          buildListItem('If symptoms persist or worsen, consult a doctor immediately', isNumbered: false),
          
          const SizedBox(height: 24),
          Text(
            '📞 Emergency & Support Contact',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildListItem('For urgent medical assistance, contact your local emergency number', isNumbered: false),
          buildListItem('For appliance-related issues or suspected malfunctions, contact Nosh Support at: 📞 +91-80-47493079', isNumbered: false),

          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
