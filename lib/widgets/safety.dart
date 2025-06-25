
import 'package:flutter/material.dart';

class Safety extends StatelessWidget {
  const Safety({super.key});

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
          Text(
            'Safety',
            style: TextStyle(
              color: const Color(0xFFFF6B2C),
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '1. Ingredients',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Be careful while inserting the tray for pinching',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Be careful while removal of the tray for pinching',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not put hand inside the machine near the back of tray area while operation',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Do not put fingers inside the handle while inserting to prevent pinching',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Do not put hand inside while ingredients tray is moving or dispensing ingredients',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Do not eject the tray while it is in operation, may cause jamming and damage the tray',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'If there is dispensing error, make sure the slider is inserted completely before ejecting the tray',
            isNumbered: true,
            number: 7,
          ),
          buildListItem(
            'Do not remove the tray forcefully ( without pressing the button )',
            isNumbered: true,
            number: 8,
          ),
          buildListItem(
            'Heavy tray, exercise caution while handling tray to avoid drops causing serious injury ( specially around children )',
            isNumbered: true,
            number: 9,
          ),
          buildListItem(
            'Carefully wash and store the tray to avoid microbial growth causing serious health issues',
            isNumbered: true,
            number: 10,
          ),
          buildListItem(
            'Do not put finger in the slots present at the bottom of ingredients tray while tray is moving',
            isNumbered: true,
            number: 11,
          ),
          buildListItem(
            'Clean in between sealing lip of slider to prevent microbial growth',
            isNumbered: true,
            number: 12,
          ),
          buildListItem(
            'Make sure sliders is completely dry before storage to prevent microbial growth',
            isNumbered: true,
            number: 13,
          ),

          const SizedBox(height: 70),
          Text(
            '2. Device',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Do not perform self repair on device',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Do not spill water inside the cooking chamber, it may short the induction and cause electrical hazard',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Be careful of sharp edge around front of the device and top of cooking chamber while cleaning',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Do not put hand inside and above the oil water area, moving parts can cause pinching and severe injuries',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Do not put hand inside the chimney filter area of the device , moving fan blade present can cause severe injuries',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Do not put hand inside duct, moving fan blade present can cause severe injuries',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'Do not spill water near the bottom area, near the induction. Can electrocute you.',
            isNumbered: true,
            number: 7,
          ),
          buildListItem(
            'Do not try to taste the food while nosh is doing cooking',
            isNumbered: true,
            number: 8,
          ),
          buildListItem(
            'Do not place hot pan directly on door inner surface as it may damage the surface and leave permanent marks',
            isNumbered: true,
            number: 9,
          ),
          buildListItem(
            'Do not clean under the device immediately after cooking as the Induction may still be hot and cause burn injuries',
            isNumbered: true,
            number: 10,
          ),
          buildListItem(
            'Make sure the legs are 1 inch inward from the outside edge of countertop',
            isNumbered: true,
            number: 11,
          ),
          buildListItem(
            'Do not put weight or let kids hang from the open door, may damage the door hinge or cause the device to topple over',
            isNumbered: true,
            number: 12,
          ),
          buildListItem(
            'Do not place the device very close to the edge of the countertop',
            isNumbered: true,
            number: 13,
          ),
          buildListItem(
            'Door should have surface some surface to rest on countertop',
            isNumbered: true,
            number: 14,
          ),
          buildListItem(
            'Do not block the duct area or duct',
            isNumbered: true,
            number: 15,
          ),
          buildListItem(
            'Keep the induction area clear for air circulation',
            isNumbered: true,
            number: 16,
          ),

          const SizedBox(height: 70),
          Text(
            '3. Spice',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('Clean', isNumbered: true, number: 1),
          buildListItem(
            'Do not put hand inside the spice assembly while in operation',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not remove the tray while in operation',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'While cleaning the spice collecting area, make sure you take care of the sharp edges inside',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Do not put finger or hand inside the container while in operation',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Make sure all the containers are locked before starting the device',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Be careful of sharp edges while cleaning the tray and spice container',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'Make sure all lids are closed before running the device',
            isNumbered: true,
            number: 7,
          ),
          buildListItem(
            'Make sure the tray is seated properly on the rotating assembly before starting',
            isNumbered: true,
            number: 8,
          ),
          buildListItem(
            'Do not self repair device',
            isNumbered: true,
            number: 9,
          ),
          buildListItem(
            'Make sure you assemble spice at their respective slots',
            isNumbered: true,
            number: 10,
          ),
          buildListItem(
            'Check spice weekly, and make sure there is no insect or fungal growth',
            isNumbered: true,
            number: 11,
          ),

          const SizedBox(height: 70),
          Text(
            '4. Oil and Water',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Do not mix oil and water , fill oil in oil container only',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Use only fresh oil in device',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not spill water near the induction area while filling',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Clean the filters regularly or when you see discolouration or microbial build up',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Make sure you do deep cleaning of oil water tubes once in every 3 month',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Clean the container once a month or you see microbial growth',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'Wash the containers and deep clean the pipes immediately if you get foul smell from the containers',
            isNumbered: true,
            number: 7,
          ),
          buildListItem(
            'Remove and store oil from the container to an airtight container if planning to not use the device for a long time',
            isNumbered: true,
            number: 8,
          ),
          buildListItem(
            'After swapping oil in the container dispense 50 mL to clear any residual oil in the pipe',
            isNumbered: true,
            number: 9,
          ),
          buildListItem(
            'Make sure you place the inlet pipe in the designated hole to prevent oil from dripping and getting stored in the area creating bad odour',
            isNumbered: true,
            number: 10,
          ),

          const SizedBox(height: 70),
          Text(
            '5. Pan',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Do not use metal or hard scrubbers on the coated ( brown ) surface as it me reduce the coating life',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Never put lid on the pan while cooking',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not try to pull the pan out while cooking is happening ( always pause the cooking before doing so )',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Immediately replace the Pan if you see dents or bend or if you have dropped the pan, or loose handle , do not use damaged pan with nosh',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Do not use any Pan other than what was provided by Nosh or purchased as an accessory',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Make sure the pan is inserted completely before starting to cook',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Be careful while removing the Pan after cooking, the pan will be extremely hot',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'Wear hot gloves to protect hands from burns while handling the pan',
            isNumbered: true,
            number: 7,
          ),
          const SizedBox(height: 70),
          Text(
            '6. Stirrer',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Do not try to pull the pan out while cooking is happening',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Immediately replace the stirrer if you see cracks on the flexible surface ( cracks can develop microbial growth',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not try to take the stirrer out while cooking is happening',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Store the stirrer carefully along with other spatula',
            isNumbered: true,
            number: 4,
          ),
          buildListItem(
            'Immediately replace the stirrer if you see any form of deformation or damage in the plastic area',
            isNumbered: true,
            number: 5,
          ),
          buildListItem(
            'Do not touch the stirrer immediately after cooking, it can be hot and cause burning injuries',
            isNumbered: true,
            number: 6,
          ),
          buildListItem(
            'Do not put hand in the pan area or in the cooking chamber while the stirrer is coming down, it can cause pinch / crushing injuries',
            isNumbered: true,
            number: 7,
          ),

          const SizedBox(height: 70),
          Text(
            '7. Exhaust and filter',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(
            'Create sufficient room towards the right side before removing the filter',
            isNumbered: true,
            number: 1,
          ),
          buildListItem(
            'Relatively heavy, handle with care, dropping it can cause injuries',
            isNumbered: true,
            number: 2,
          ),
          buildListItem(
            'Do not put filter in dishwasher',
            isNumbered: true,
            number: 3,
          ),
          buildListItem(
            'Make sure to insert the filter before cooking in device',
            isNumbered: true,
            number: 4,
          ),

          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
