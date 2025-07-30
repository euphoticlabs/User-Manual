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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Safety',
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
            '1. Child Safety',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 30),
          
          Text(
            '1. 🚫 Keep Out of Reach',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
            Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('Always place the appliance out of reach of young children', isNumbered: false),
              buildListItem('Ensure children do not operate or play with the device under any circumstance', isNumbered: false),
            ],
          ),),
          
          const SizedBox(height: 16),
          Text(
            '2. ⚠️ During Operation',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('Never leave the appliance unattended while in use, especially if children are nearby', isNumbered: false),
              buildListItem('The cooking chamber, pan, oil container, and induction surface can become extremely hot. Prevent children from touching or going near these areas', isNumbered: false),
            ],
          ),),
          
          const SizedBox(height: 16),
          Text(
            '3. 🧲 Prevent Tipping or Pulling',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('Do not let children hang on or pull the door or any part of the appliance', isNumbered: false),
              buildListItem('Ensure the appliance is placed on a stable, flat surface, away from countertop edges', isNumbered: false),
            ],
          ),),
          
          const SizedBox(height: 16),
          Text(
            '4. 💥 Storage & Accessories',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('Store sharp, heavy, or detachable parts like stirrers, pans, and containers safely out of children\'s reach', isNumbered: false),
              buildListItem('Avoid leaving the door open when not in use, as it may be tempting for children to interact with or climb on', isNumbered: false),
            ],
          ),),
          
          const SizedBox(height: 16),
          Text(
            '5. ⚡ Power Safety',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('Keep the power cord out of children\'s reach', isNumbered: false),
              buildListItem('Use child-proof socket covers if necessary, especially if the appliance is placed in low-access kitchen areas', isNumbered: false),
            ],
          ),),
          
          const SizedBox(height: 16),
          Text(
            '6. 📌 Reminder',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Padding(padding: const EdgeInsets.only(left: 20), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListItem('This appliance is not a toy. Always supervise children in kitchens and educate older children about the potential dangers of hot surfaces and moving parts', isNumbered: false),
            ],
          ),),
          const SizedBox(height: 70),
          Text(
            '2. Ingredients',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('🧷 The tray fits snugly — insert and remove it gently to avoid any pinching', isNumbered: true, number: 1),
          buildListItem('🛡️ Our system protects you during operation — please keep hands away from the back tray area while the machine is running', isNumbered: true, number: 2),
          buildListItem('☝️ For added safety, avoid placing fingers inside the handle during tray insertion', isNumbered: true, number: 3),
          buildListItem('⚙️ The tray moves automatically when dispensing — keep hands clear to ensure smooth operation', isNumbered: true, number: 4),
          buildListItem('🚫🛑 For best performance, avoid ejecting the tray mid-operation. This prevents jamming and protects the tray', isNumbered: true, number: 5),
          buildListItem('🔄 In case of any dispensing issue, ensure the slider is fully inserted before removing the tray', isNumbered: true, number: 6),
          buildListItem('🔒 Always use the eject button to remove the tray — do not force it', isNumbered: true, number: 7),
          buildListItem('🪶 The tray is built to be durable and sturdy. Handle with care, especially around children 👶, to avoid injury', isNumbered: true, number: 8),
          buildListItem('🧼 To maintain freshness and hygiene, wash and dry the tray thoroughly before storing', isNumbered: true, number: 9),
          buildListItem('🚫✋ The tray design includes safety slots — please keep fingers clear while it\'s moving', isNumbered: true, number: 10),
          buildListItem('🧽🦠 Regularly clean the slider\'s sealing edge to prevent microbial growth 🦠', isNumbered: true, number: 11),
          buildListItem('💨 Before storing, make sure the slider is completely dry to ensure hygienic re-use', isNumbered: true, number: 12),

          const SizedBox(height: 70),
          Text(
            '3. Device',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(' Avoid self-repair: The device contains sensitive electrical and mechanical components — please contact support for any service needs', isNumbered: true, number: 1),
          buildListItem('💧 Keep liquids out of the cooking chamber: Spilling water may damage internal systems like induction and pose an electrical hazard ⚡', isNumbered: true, number: 2),
          buildListItem('🧽 Handle edges with care: While cleaning, be mindful of sharp edges around the front and top of the cooking chamber', isNumbered: true, number: 3),
          buildListItem('🚫 Stay clear of the oil and water zones: These areas contain moving parts. Avoid placing your hand inside to prevent pinching or injury', isNumbered: true, number: 4),
          buildListItem('💨❌ Avoid reaching into the chimney or duct areas: Moving fan blades inside may cause serious harm', isNumbered: true, number: 5),
          buildListItem('💧⚠️ Keep water away from the bottom of the device: Especially near the induction area — spills here could cause electric shock', isNumbered: true, number: 6),
          buildListItem('👅🚫 No tasting during cooking: Let the device complete the cook cycle safely and hygienically', isNumbered: true, number: 7),
          buildListItem('🔥🧱 Avoid placing hot pans on the door: It may damage the inner surface and leave permanent marks', isNumbered: true, number: 8),
          buildListItem('⏰❄️ Let the device cool before cleaning underneath: The induction area may stay hot for a while after cooking', isNumbered: true, number: 9),
          buildListItem('📏👣 Position the legs properly: Ensure the legs are set at least 1 inch inward from the countertop edge for stability', isNumbered: true, number: 10),
          buildListItem('👶⚠️ Keep children safe: Do not let them hang on the open door — it could damage the hinge or tip the appliance', isNumbered: true, number: 11),
          buildListItem('➡️ Place the device securely: Keep it away from the edge of the countertop and ensure the door rests on a stable surface when open', isNumbered: true, number: 12),
          buildListItem('💨✅ Ensure proper ventilation: Keep the duct area and induction zone clear for uninterrupted airflow and efficient performance', isNumbered: true, number: 13),

          const SizedBox(height: 70),
          Text(
            '4. Spice',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem(' Never insert hands into the spice assembly while it\'s operating – let the device complete its cycle safely', isNumbered: true, number: 1),
          buildListItem('⛔ Avoid removing the tray during operation – doing so may interrupt cooking or cause mechanical issues', isNumbered: true, number: 2),
          buildListItem('⚠️ Use caution when cleaning the spice collection area – internal edges may be sharp', isNumbered: true, number: 3),
          buildListItem('🔄🚫 Do not touch or insert fingers into containers while the device is running – moving parts may cause injury', isNumbered: true, number: 4),
          buildListItem('✅ Ensure all containers are locked securely before starting a cook to prevent spills or malfunctions', isNumbered: true, number: 5),
          buildListItem('👐 Handle with care when cleaning trays and spice containers – some parts may have sharp edges', isNumbered: true, number: 6),
          buildListItem('✅ Verify that all lids are closed before starting the device to maintain a sealed, safe cooking environment', isNumbered: true, number: 7),
          buildListItem('🔍 Confirm the tray is properly seated on the rotating assembly before starting a cook for smooth operation', isNumbered: true, number: 8),
          buildListItem('️ Do not attempt to repair the device yourself – contact our service team for any technical support', isNumbered: true, number: 9),
          buildListItem('🧂 Always place spices in their designated slots – this ensures correct ingredient dispensing during recipes', isNumbered: true, number: 10),
          buildListItem('🐜🔍 Inspect spice contents weekly to check for insects or moisture buildup and maintain freshness', isNumbered: true, number: 11),

          const SizedBox(height: 70),
          Text(
            '5. Oil and Water',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('✅ Always fill oil only in the designated oil container – never mix oil and water in any container', isNumbered: true, number: 1),
          buildListItem('🫒 Use only fresh oil in the device for best cooking results and to avoid contamination', isNumbered: true, number: 2),
          buildListItem('💦⚡ Take care not to spill water near the induction area – this section has sensitive electrical components', isNumbered: true, number: 3),
          buildListItem('🧼🌀 Clean the filters regularly, especially if you notice discolouration or microbial buildup', isNumbered: true, number: 4),
          buildListItem('🧽🗓️ Deep clean oil and water tubes every 3 months to ensure safe and efficient operation', isNumbered: true, number: 5),
          buildListItem('🧼🧴 Clean the oil and water containers monthly, or immediately if you see microbial growth', isNumbered: true, number: 6),
          buildListItem('👃 If there\'s a foul smell, wash the containers and deep clean pipes before reuse', isNumbered: true, number: 7),
          buildListItem('📦🛑 If unused for a while, remove oil and store in an airtight container to prevent spoilage', isNumbered: true, number: 8),
          buildListItem('🔄 After replacing oil, dispense 50 mL to flush out residual old oil from the pipe system', isNumbered: true, number: 9),
          buildListItem('🌿✅ Ensure the inlet pipe is placed correctly in its slot to prevent oil drips and odours', isNumbered: true, number: 10),

          const SizedBox(height: 70),
          Text(
            '6. Pan',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('✅ Only use the official Nosh pan provided or purchased as an approved accessory', isNumbered: true, number: 1),
          buildListItem('🚫 Never place a lid on the pan while cooking – the appliance is designed for open-pan operation', isNumbered: true, number: 2),
          buildListItem('⏸️ Always pause cooking before removing the pan – do not attempt to pull it out mid-cook', isNumbered: true, number: 3),
          buildListItem('⚠️ Avoid using metal or abrasive scrubbers on the coated (brown) surface – this may reduce non-stick life', isNumbered: true, number: 4),
          buildListItem('🔧 Replace the pan immediately if it\'s dropped, dented, has a loose handle, or shows any damage. A compromised pan can affect cooking and safety', isNumbered: true, number: 5),
          buildListItem('✅ Ensure the pan is fully inserted and properly seated before starting to cook', isNumbered: true, number: 6),
          buildListItem('🔥 The pan will be extremely hot after cooking – use caution when removing it', isNumbered: true, number: 7),
          buildListItem('🧤 Best advised to wear heat-resistant gloves when handling the hot pan to prevent burns', isNumbered: true, number: 8),

          const SizedBox(height: 70),
          Text(
            '7. Stirrer',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('⛔🛑 Do not remove the pan or stirrer during cooking – always pause or stop the cook before accessing them', isNumbered: true, number: 1),
          buildListItem('✋⚙️ Avoid placing your hand in the pan or cooking chamber while the stirrer is moving – this may cause pinching or crushing injuries', isNumbered: true, number: 2),
          buildListItem('♨️🔥 Do not touch the stirrer immediately after cooking – it may be hot and can cause burns', isNumbered: true, number: 3),
          buildListItem('🔍 Replace the stirrer immediately if you notice any cracks on the flexible surface – cracks can harbor microbial growth', isNumbered: true, number: 4),
          buildListItem('⚠️🌿 Do not use the stirrer if you see deformation or damage in the plastic areas – it may impact performance and hygiene', isNumbered: true, number: 5),
          buildListItem('📦🔧 Store the stirrer safely with other kitchen tools to avoid damage and keep it clean', isNumbered: true, number: 6),

          const SizedBox(height: 70),
          Text(
            '8. Exhaust and filter',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('↔️🧽 Always create enough space on the right side of the device before removing the filter to avoid obstruction or damage', isNumbered: true, number: 1),
          buildListItem('🪶⚠️ The filter is relatively heavy – handle with care to prevent accidental drops or injuries', isNumbered: true, number: 2),
          buildListItem('🧼 Do not place the filter in a dishwasher – clean manually as per the care instructions', isNumbered: true, number: 3),
          buildListItem('✅🔍 Ensure the filter is properly inserted before starting a cook – the device requires the filter for safe operation', isNumbered: true, number: 4),
          Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 30), child: Image.asset('assets/images/chimney/chimney9.png'),),
          const SizedBox(height: 70),
        ],
        ),
      ),
    );
  }
}
