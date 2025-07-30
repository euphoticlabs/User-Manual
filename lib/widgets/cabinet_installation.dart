
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

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
              child: ImageLoader(
              imagePath: url,
              width: width ?? imageWidth,
              height: 0,
              isNetwork: false,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cabinet Installation',
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
          Text(
            '📎 Requirements',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('Below are the dimensions required for the cabinet', isNumbered: true, number: 1),
          buildListItem('The height dimension is based on the average countertop height', isNumbered: true, number: 2),
          buildListItem('For best experience it is suggested to install the device at countertop height', isNumbered: true, number: 3),
          buildListItem('For Drawer rails, 45 Kg 500mm tandem channels can be used ( 90 Kg is recommended )', isNumbered: true, number: 4),
          
          const SizedBox(height: 16),
         
         Padding(padding: const EdgeInsets.symmetric(horizontal: 100.0), child: Image.asset('assets/images/cabinet_installation/cabinet_installation1.png')),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 100.0), child: Image.asset('assets/images/cabinet_installation/cabinet_installation2.png')),
          const SizedBox(height: 8),
          buildListItem('Pull the old chimney duct out', isNumbered: true, number: 1),
          buildListItem('Put the new chimney duct compatible with ducting pipe', isNumbered: true, number: 2),
          buildListItem('Push the duct cap into place', isNumbered: true, number: 3),
          buildImage('${R.cabinetInstallation}cabinet_installation3.png'),
          const SizedBox(height: 16),
          Text(
            '📐 Kitchen requirements',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('Overall Height: Align cabinet opening with standard countertop height (approximately 900 mm from finished floor) for optimal reach', isNumbered: true, number: 1),
          buildListItem('Installation Height: Top of device should sit at countertop height for best user experience', isNumbered: true, number: 2),
          buildListItem('Front Clearance: Minimum 500 mm unobstructed space in front of cabinet to fully pull device out', isNumbered: true, number: 3),
          buildListItem('Drawer Slides: Use 500 mm tandem-slide channels rated for at least 90 kg (45 kg slides will work but 90 kg is recommended for longevity)', isNumbered: true, number: 4),
          
          const SizedBox(height: 16),
          Text(
            '📝 Notes',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          buildListItem('Standard countertop height varies but typically sits around 900 mm above finished floor - adjust if cabinetry differs', isNumbered: true, number: 1),
          buildListItem('Ensure 500 mm front clearance is not blocked by island overhangs or adjacent cabinetry', isNumbered: true, number: 2),
          buildListItem('Specifying 90 kg-rated slides provides extra margin for load and wear over time', isNumbered: true, number: 3),
          buildImage('${R.cabinetInstallation}cabinet_installation4.png'),
          const SizedBox(height: 16),
          Text(
            '🔨 Installation',
            style: TextStyle(
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          buildListItem('Rails for Access: Install slide-out rails so you can smoothly pull the device forward for spice and filter access', isNumbered: true, number: 1),
          buildListItem('Duct Replacement: Swap in the new duct cap as shown above', isNumbered: true, number: 2),
          buildListItem('Exhaust Fan: Mount a 100 mm fan inside the cabinet, using 4″ ducting to channel all cooking fumes outside', isNumbered: true, number: 3),
          buildListItem('Device Placement: Secure the device on the drawer and adjust until it moves freely without touching the walls', isNumbered: true, number: 4),
          buildListItem('Clearance Gap: Leave a consistent 19 mm gap around the device to prevent rubbing', isNumbered: true, number: 5),
          buildListItem('Child Lock: Fit a child-safety lock so the device can\'t slide out when the door opens', isNumbered: true, number: 6),
          buildListItem('Duct Routing: Tailor the ducting run to your kitchen\'s layout to vent exhaust outdoors', isNumbered: true, number: 7),
          buildListItem('Power Provision: Install a dedicated, grounded outlet inside the cabinet so both the device and fan can be powered safely and comply with local electrical codes', isNumbered: true, number: 8),
          buildListItem('Switch Location: Mount the on/off switches for the device and fan on a nearby control board (e.g. backsplash or adjacent wall panel), not inside the cabinet, for easy access', isNumbered: true, number: 9),
          buildImage('${R.cabinetInstallation}cabinet_installation5.png'),
          const SizedBox(height: 16),
         ],
      ),
      ),
    );
  }
} 