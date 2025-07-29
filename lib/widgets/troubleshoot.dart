import 'package:flutter/material.dart';

class Troubleshoot extends StatelessWidget {
  const Troubleshoot({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 500 ? 22 : 32;
    double sectionFontSize = screenWidth < 500 ? 16 : 18;
    double tableHeaderFontSize = screenWidth < 500 ? 14 : 16;
    double tableCellFontSize = screenWidth < 500 ? 13 : 15;

    Widget buildQAPair(String question, String answer) => Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: sectionFontSize),
          children: [
            const TextSpan(
              text: 'Q. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '$question\n',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: 'A. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: answer,
            ),
          ],
        ),
      ),
    );

    Widget buildErrorTable(List<List<String>> rows) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withAlpha(20),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.orange.shade200, width: 1),
            verticalInside: BorderSide(color: Colors.orange.shade200, width: 1),
          ),
          columnWidths: const {
            0: FixedColumnWidth(80),
            1: FlexColumnWidth(3),
            2: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFF6B2C)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error Code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Message', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Troubleshoot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
              ],
            ),
            ...rows.asMap().entries.map((entry) {
              final i = entry.key;
              final row = entry.value;
              final bgColor = i % 2 == 0 ? Colors.white : Colors.orange.shade50;
              
              return TableRow(
                decoration: BoxDecoration(color: bgColor),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(row[0], style: TextStyle(fontSize: tableCellFontSize, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(row[1], style: TextStyle(fontSize: tableCellFontSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(row[2], style: TextStyle(fontSize: tableCellFontSize)),
                  ),
                ],
              );
            }),
          ],
        ),
      );
    }

    // Updated error table with troubleshoot solutions
    final errorTable = [
      ['-1', 'Platform timed out moving forward.', 'Contact customer support'],
      ['-2', 'Platform timed out moving backward.', 'Contact customer support'],
      ['-3', 'Pusher timed out.', 'Contact customer support'],
      ['-4', 'Platform timed out while dispensing.', 'Contact customer support'],
      ['-5', 'Platform timed out while dispensing.', 'Contact customer support'],
      ['-6', 'Ingredient tray is removed. Please push it back in to continue.', 'Reinsert the ingredient tray and hit retry, if issue persist contact customer support'],
      ['-7', 'Platform stuck moving forward.', 'Ensure there is no obstruction for platform, if issue persist contact customer support'],
      ['-8', 'Platform stuck moving Backward.', 'Ensure there is no obstruction for platform, if issue persist contact customer support'],
      ['-9', 'Platform stuck while dispensing ingredient.', 'Ensure there is no obstruction for platform, if issue persist contact customer support'],
      ['-10', 'Pusher stuck while homing.', 'Ensure there is no obstruction for platform, if issue persist contact customer support'],
      ['-11', 'Pusher stuck while dispensing.', 'Ensure there is no obstruction for platform, if issue persist contact customer support'],
      ['-12', 'Slider isn\'t fully in place. Please slide it all the way in to continue.', 'Ensure slider is fully inside and retry'],
      ['-13', 'Tof Sensor Error', 'Contact customer support'],
      ['-14', 'Timeout while dispensing the food', 'Contact customer support'],
      ['-15', 'Pan not detected. Please place it correctly into the pan holder to continue.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-17', 'Spice-cam stuck', 'Check if the spice is moist / damp, try rotating the dispenser blade manually and put it back inside the device'],
      ['-18', 'Spice-dispense timed-out', 'Contact customer support'],
      ['-19', 'Spice-Assembly timeout while homing', 'Contact customer support'],
      ['-20', 'Spice-cam stuck', 'Check if the spice is moist / damp, try rotating the dispenser blade manually and put it back inside the device'],
      ['-21', 'Spice-cam not responding', 'Contact customer support'],
      ['-22', 'Spice-cam not responding', 'Contact customer support'],
      ['-24', 'Spice box not detected. Please ensure it is in place to continue.', 'Make sure spice tray is fully seated'],
      ['-25', 'Pan not detected. Please place it correctly into the pan holder to continue.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-26', 'Stirrer not responding while moving up', 'Contact customer support'],
      ['-27', 'Stirrer not responding while moving down', 'Contact customer support'],
      ['-28', 'Stirrer Alignment failed', 'Contact customer support'],
      ['-32', 'Pan not detected. Please ensure it\'s properly placed on the induction glass top to continue.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-33', 'Induction not responding', 'Contact customer support'],
      ['-34', 'Induction not responding', 'Contact customer support'],
      ['-35', 'Induction not responding', 'Contact customer support'],
      ['-36', 'Induction not responding', 'Contact customer support'],
      ['-37', 'Induction not responding', 'Contact customer support'],
      ['-38', 'Induction not responding', 'Contact customer support'],
      ['-39', 'Induction not responding', 'Contact customer support'],
      ['-40', 'Induction not responding', 'Contact customer support'],
      ['-41', 'Induction not responding', 'Contact customer support'],
      ['-42', 'Pan not detected. Please place it correctly into the pan holder to continue.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-45', 'Temperature sensor not responding', 'Contact customer support'],
      ['-49', 'Oops! The oil ran out during dispensing. Please refill and continue, though it might slightly affect the final cooking result.', 'Refill the oil till 400mL mark and retry'],
      ['-50', 'Not able to fill the oil tube', 'Refill the oil till 400mL mark and retry, if issue persist contact customer support'],
      ['-51', 'Oil pump encoder not responding', 'Contact customer support'],
      ['-52', 'Oil pump not responding', 'Contact customer support'],
      ['-53', 'Oops! The water ran out during dispensing. Please refill and continue, though it might slightly affect the final cooking result.', 'Refill the water and retry'],
      ['-54', 'Not able to fill the water tube', 'Refill the water and retry, if issue persist contact customer support'],
      ['-55', 'Water pump encoder not responding', 'Contact customer support'],
      ['-56', 'Water pump not responding', 'Contact customer support'],
      ['-57', 'Pan not detected. Please place it correctly into the pan holder to continue.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-58', 'Oil pump stuck', 'Contact customer support'],
      ['-59', 'Water pump stuck', 'Contact customer support'],
      ['-61', 'SBC comm error', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-62', 'I2C comm error', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-63', 'ToF System error', 'Contact customer support'],
      ['-64', 'ECE failure', 'Contact customer support'],
      ['-65', 'Early convergence estimate fail', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-66', 'No target detected', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-67', 'Ignore threshold check failed', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-68', 'Ambient conditions too high', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-69', 'Raw range algo overflow/underflow', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-70', 'Raw range algo overflow/underflow', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-71', 'Raw range algo overflow/underflow', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-72', 'Raw range algo overflow/underflow', 'Fully insert the slider and tap retry, if issue persist contact customer support'],
      ['-73', 'I2C Write error', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-74', 'I2C Read error', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-75', 'Sensor initialization error', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-76', 'Timeout', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-77', 'Timeout', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-78', 'Communication Failure', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-79', 'Induction Heat Test Failed', 'Contact customer support'],
      ['-80', 'Error code for timeout', 'Contact customer support'],
      ['-81', 'Error code for timeout', 'Contact customer support'],
      ['-82', 'Uart tx timeout', 'Contact customer support'],
      ['-83', 'Pan not detected or not placed correctly. Please reinsert the pan and press Retry.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-84', 'Stirrer motor is stuck or pan misaligned. Please reinsert the pan and press Retry.', 'Place the pan correctly, switch is pressed by handle and placed between bumpon'],
      ['-100', 'Wrong command', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['-101', 'Break', ''],
      ['-102', 'Trig manual control', ''],
      ['400', 'Usb configured but not initialized', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['408', 'Device not responding! Please restart the device', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
      ['502', 'Lost connection with hardware, please restart device', 'Tap retry, if that doesn\'t work, restart the device, if issue persist contact customer support'],
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Troubleshoot',
                style: TextStyle(
                  color: const Color(0xFFFF6B2C),
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Text('🔧 General troubleshooting',
                style: TextStyle(
                  fontSize: sectionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          buildQAPair(
            'My dish came out watery / dry, what to do?',
            'You can use the cook more function at the end of cooking to adjust the consistency',
          ),
          buildQAPair(
            'There is taste variation in dish, dish tastes bland?',
            'Check all the spice level and check if any spice is below refill mark. Additionally you can adjust the spice level in taste preference to improve the taste.',
          ),
          buildQAPair(
            'Food is sticking to pan surface and is difficult to remove, what to do?',
            'Check if the Pan is heavily scratched indicating coating wear. Make sure you follow cleaning instructions for pan to improve coating life.',
          ),
          buildQAPair(
            'Power went off while cooking, what to do?',
            'You can resume the cooking from where it was interrupted. If the power outage is for a longer duration you can remove the tray and continue cooking manually. If the power outage happened while one of the slot dispensing, the tray cannot be removed in this state.',
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.block, color: Color(0xFFFF6B2C), size: 24),
              const SizedBox(width: 8),
              Text('Error codes',
                style: TextStyle(
                  fontSize: sectionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildErrorTable(errorTable),
        ],
      ),
    );
  }
} 