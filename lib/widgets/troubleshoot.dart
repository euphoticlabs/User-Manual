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
              color: Colors.orange.withOpacity(0.08),
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
            0: FixedColumnWidth(60),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(3),
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
                  child: Text('ERROR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Reason', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: tableHeaderFontSize)),
                ),
              ],
            ),
            ...rows.asMap().entries.map((entry) {
              final i = entry.key;
              final row = entry.value;
              final isOkRow = row[0] == 'OK';
              final bgColor = isOkRow
                  ? Colors.orange.shade50
                  : i % 2 == 0
                      ? Colors.white
                      : Colors.orange.shade50;
              // if (isOkRow) {
              //   // Visually merge all columns for OK row
              //   return TableRow(
              //     decoration: BoxDecoration(color: bgColor),
              //     children: [
              //       TableCell(
              //         verticalAlignment: TableCellVerticalAlignment.middle,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Center(
              //             child: Text(
              //               row[1],
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.orange,
              //                 fontSize: tableCellFontSize,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox.shrink(),
              //       const SizedBox.shrink(),
              //     ],
              //   );
              // } else {
                return TableRow(
                  decoration: BoxDecoration(color: bgColor),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row[0], style: TextStyle(fontSize: tableCellFontSize)),
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
              // }
            }),
          ],
        ),
      );
    }

    // Error code data (partial, add more as needed)
    // Only the first row in each table has the code filled, rest are empty for now as per user request
    final errorTable1 = [
      ['-54', 'ERROR TIMEOUT MAX TRAY', 'Sensor failure, Tray got detached and stuck'],
      ['', 'OK', 'Good To Go'],
      ['', 'ERROR_PLM_MAX_TIMEOUT_FRONT', 'Platform timed out moving forward.'],
      ['', 'ERROR_PLM_MAX_TIMEOUT_BACK', 'Platform timed out moving backward.'],
      ['', 'ERROR_PSH_MAX_TIMEOUT', 'Pusher timed out.'],
      ['', 'ERROR_PLM_DISP_MAX_TIMEOUT', 'Platform timed out while dispensing.'],
      ['', 'ERROR_DISPENSE_MAX_TIMEOUT', 'Platform timed out while dispensing.'],
      ['', 'ERROR_TRAY_SLIPPED', 'Tray not detected. Please reinsert.'],
      ['', 'ERROR_PLM_FRONT_CS', 'Platform stuck moving forward.'],
      ['', 'ERROR_PLM_BACK_CS', 'Platform stuck moving backward.'],
      ['', 'ERROR_PLM_DISP_CS', 'Platform stuck while dispensing ingredient'],
      ['', 'ERROR_PSH_DISPENSE_CS', 'Pusher stuck while Dispensing'],
      ['', 'ERROR_ING_SLIDER_NOT_FOUND', 'Ingredient Slider not detected. Please reinsert.'],
      ['', 'ERROR_TOF', 'Tof Sensor Error'],
      ['', '', ''], // empty row for spacing
      ['', 'TEMP_ERR_1', ''],
      ['', 'TEMP_ERR_2', ''],
      ['', 'TEMP_ERR_3', ''],
      ['', 'ERROR_CAM_STUCK_CS', 'Spice-cam stuck'],
      ['', 'ERROR_CAM_STUCK_TO', 'Spice-dispenser timed out'],
    ];

    final errorTable2 = [
      ['ERROR_SPICEX_HOME_MAX_TIMEOUT', 'Spice-Assembly timeout while homing', ''],
      ['', 'ERROR_PISTON_STUCK', 'Spice-cam stuck'],
      ['', 'ERROR_SPICE_DISP_MAX_TIMEOUT', 'Spice-cam not responding'],
      ['', 'ERROR_CAM_HOME_MAX_TIMEOUT', 'Spice-cam not responding'],
      ['', 'TEMP_ERR_4', ''],
      ['', 'TEMP_ERR_5', ''],
      ['', 'TEMP_ERR_6', ''],
      ['', 'ERROR_STRR_UP_MAX_TIMEOUT', 'Stirrer not responding while moving up'],
      ['', 'ERROR_STRR_DOWN_MAX_TIMEOUT', 'Stirrer not responding while moving down'],
      ['', 'ERROR_STRR_ALIGN_MAX_TIMEOUT', 'Stirrer Alignment failed'],
      ['', 'TEMP_ERR_7', ''],
      ['', 'TEMP_ERR_8', ''],
      ['', 'TEMP_ERR_9', ''],
      ['', 'ERROR_PAN_NOT_DETECT', 'Pan not detected. Please reinsert'],
      ['', 'ERROR_LOW_PRESSURE', 'Induction not responding'],
      ['', 'ERROR_HIGH_PRESSURE', 'Induction not responding'],
      ['', 'ERROR_STOVE_CTX_FAIL', 'Induction not responding'],
      ['', 'ERROR_STOVE_SENSOR_FAIL', 'Induction not responding'],
      ['', 'ERROR_STOVE_VGBT_SENSOR_FAIL', 'Induction not responding'],
      ['', 'ERROR_STOVE_VGBT_FAIL', 'Induction not responding'],
    ];

    final errorTable3 = [
      ['ERROR_UNKNOWN_STOVE', 'Induction not responding', ''],
      ['', 'ERROR_INDUCTION_UART_COMM_BREAK', 'Induction not responding'],
      ['', 'ERROR_INDUCTION_QUERY_TIMEOUT', 'Induction not responding'],
      ['', 'TEMP_ERR_10', ''],
      ['', 'TEMP_ERR_11', ''],
      ['', 'TEMP_ERR_12', 'Temperature sensor not responding'],
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
          buildErrorTable(errorTable1),
          const SizedBox(height: 24),
          buildErrorTable(errorTable2),
          const SizedBox(height: 24),
          buildErrorTable(errorTable3),
        ],
      ),
    );
  }
} 