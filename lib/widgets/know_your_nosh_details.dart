import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';
import 'package:responsive_framework/responsive_framework.dart';

class KnowYourNoshDetailsWidget extends StatelessWidget {
  const KnowYourNoshDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get responsive breakpoint
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    // Responsive text sizes
    final titleSize = isMobile ? 24.0 : isTablet ? 28.0 : 32.0;
    final stepTextWeight = isMobile ? FontWeight.w400 : FontWeight.w500;
    final screenWidth = MediaQuery.of(context).size.width;
    double stepTextSize = screenWidth < 500 ? 16 : 18;

    // Responsive image sizes
    final mainImageWidth = isMobile ? 300.0 : isTablet ? 400.0 : 500.0;
    final mainImageHeight = isMobile ? 250.0 : isTablet ? 350.0 : 400.0;
    
    // Responsive padding
    final horizontalPadding = isMobile ? 16.0 : isTablet ? 24.0 : 32.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.only(
            top: isMobile ? 50.0 : 70.0,
            bottom: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'PlayfairDisplay',
                  ),
                  children: const [
                    TextSpan(text: 'Know your '),
                    TextSpan(
                      text: 'Nosh',
                      style: TextStyle(
                        color: Color(0xFFFF6B2C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Main Image
        Center(
          child: ImageLoader(
            imagePath: '${R.knowYourNosh}knownosh1.png',
            width: mainImageWidth,
            height: mainImageHeight,
            isNetwork: false,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate available width for the content
              final availableWidth = constraints.maxWidth;
              
              // For mobile, use a smaller image that fits
              final secondImageWidth = isMobile 
                  ? (availableWidth * 0.35).clamp(120.0, 200.0)  // 35% of available width, max 200px
                  : isTablet ? 250.0 : 300.0;
              final secondImageHeight = isMobile 
                  ? (secondImageWidth * 245 / 297.84)  // Maintain aspect ratio
                  : isTablet ? 250.0 : 300.0;
              
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '''1. Spice lid\n2. Spice Tray with containers\n3. 7 inch touchscreen display\n4. Chimney filter\n5. Ingredients tray\n6. Eject button\n7. Water container\n8. Oil container\n9. Stirrer\n10. Pan\n11. Door\n12. Legs\n13. Induction\n14. Chimney duct''',
                      style: TextStyle(
                        fontSize: stepTextSize,
                        fontWeight: stepTextWeight,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 8.0 : 12.0),
                  SizedBox(
                    width: secondImageWidth,
                    child: ImageLoader(
                      imagePath: '${R.knowYourNosh}knownosh2.png',
                      width: secondImageWidth,
                      height: secondImageHeight,
                      isNetwork: false,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
