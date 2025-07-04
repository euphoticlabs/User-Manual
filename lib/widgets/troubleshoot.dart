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
            1: FlexColumnWidth(4),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFF6B2C)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Message', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
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
                ],
              );
            }),
          ],
        ),
      );
    }

    // Error code data from the provided mapping, filtered to exclude empty messages
    final errorTable = [
      ['0', 'Good to go'],
      ['-1', 'Platform timed out moving forward.'],
      ['-2', 'Platform timed out moving backward.'],
      ['-3', 'Pusher timed out.'],
      ['-4', 'Platform timed out while dispensing.'],
      ['-5', 'Platform timed out while dispensing.'],
      ['-6', 'Ingredient tray is removed. Please push it back in to continue.'],
      ['-7', 'Platform stuck moving forward.'],
      ['-8', 'Platform stuck moving Backward.'],
      ['-9', 'Platform stuck while dispensing ingredient.'],
      ['-10', 'Pusher stuck while homing.'],
      ['-11', 'Pusher stuck while dispensing.'],
      ['-12', 'Slider isn\'t fully in place. Please slide it all the way in to continue.'],
      ['-13', 'Tof Sensor Error'],
      ['-14', 'Timeout while dispensing the food'],
      ['-15', 'Pan not detected. Please place it correctly into the pan holder to continue.'],
      ['-17', 'Spice-cam stuck'],
      ['-18', 'Spice-dispense timed-out'],
      ['-19', 'Spice-Assembly timeout while homing'],
      ['-20', 'Spice-cam stuck'],
      ['-21', 'Spice-cam not responding'],
      ['-22', 'Spice-cam not responding'],
      ['-24', 'Spice box not detected. Please ensure it is in place to continue.'],
      ['-25', 'Pan not detected. Please place it correctly into the pan holder to continue.'],
      ['-26', 'Stirrer not responding while moving up'],
      ['-27', 'Stirrer not responding while moving down'],
      ['-28', 'Stirrer Alignment failed'],
      ['-32', 'Pan not detected. Please ensure it\'s properly placed on the induction glass top to continue.'],
      ['-33', 'Induction not responding'],
      ['-34', 'Induction not responding'],
      ['-35', 'Induction not responding'],
      ['-36', 'Induction not responding'],
      ['-37', 'Induction not responding'],
      ['-38', 'Induction not responding'],
      ['-39', 'Induction not responding'],
      ['-40', 'Induction not responding'],
      ['-41', 'Induction not responding'],
      ['-42', 'Pan not detected. Please place it correctly into the pan holder to continue.'],
      ['-45', 'Temperature sensor not responding'],
      ['-49', 'Oops! The oil ran out during dispensing. Please refill and continue, though it might slightly affect the final cooking result.'],
      ['-50', 'Not able to fill the oil tube'],
      ['-51', 'Oil pump encoder not responding'],
      ['-52', 'Oil pump not responding'],
      ['-53', 'Oops! The water ran out during dispensing. Please refill and continue, though it might slightly affect the final cooking result.'],
      ['-54', 'Not able  to fill the water tube'],
      ['-55', 'Water pump encoder not responding'],
      ['-56', 'Water pump not responding'],
      ['-57', 'Pan not detected. Please place it correctly into the pan holder to continue.'],
      ['-58', 'Oil pump stuck'],
      ['-59', 'Water pump stuck'],
      ['-61', 'SBC comm error'],
      ['-62', 'I2C comm error'],
      ['-63', 'System error'],
      ['-64', 'ECE failure'],
      ['-65', 'Early convergence estimate fail'],
      ['-66', 'No target detected'],
      ['-67', 'Ignore threshold check failed'],
      ['-68', 'Ambient conditions too high'],
      ['-69', 'Raw range algo underflow'],
      ['-70', 'Raw range algo overflow'],
      ['-71', 'Raw range algo overflow'],
      ['-72', 'Raw range algo overflow'],
      ['-73', 'I2C Write error'],
      ['-74', 'I2C Read error'],
      ['-75', 'Sensor initialization error'],
      ['-76', 'Timeout'],
      ['-77', 'Timeout'],
      ['-78', 'Communication  Failure'],
      ['-79', 'Induction Heat Test Failed'],
      ['-80', 'Error code for timeout'],
      ['-81', 'Error code for timeout'],
      ['-82', 'Uart tx timeout'],
      ['-83', 'Pan not inserted correctly'],
      ['-84', 'Stirrer stuck while moving down'],
      ['-100', 'Wrong command'],
      ['-101', 'Break'],
      ['-102', 'Trig manual control'],
      ['400', 'Usb configured but not initialized'],
      ['502', 'Lost connection with hardware, please restart device'],
      ['408', 'Device not responding! Please restart the device'],
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.build, color: Colors.black, size: 24),
              const SizedBox(width: 8),
              Text('🔧 General troubleshooting',
                style: TextStyle(
                  fontSize: sectionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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