import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';

class KnowYourNoshDetailsWidget extends StatelessWidget {
  const KnowYourNoshDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 16.0, bottom: 8.0),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: [
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
        ),
        // Main Image
        Center(
          child: CachedNetworkImage(
            imageUrl:
                '${R.knowYourNosh}knownosh1.png', // Replace with your actual image URL
            width: 400,
            height: 350,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        // Numbered List
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text('''1. Spice lid
2. Spice Tray with c
3. 7 inch touchscreen display
4. Chimney filter
5. Chimney inlet vents
6. Ingredients tray
7. Eject button
8. Water container
9. Oil container
10. Stirrer
11. Pan
12. Door
13. Wooden legs
14. Induction
15. Back cover
16. Chimney duct
17. Top cover sheet''', style: TextStyle(fontSize: 16, height: 1.5)),
              Center(
                child: CachedNetworkImage(
                  imageUrl:
                      '${R.knowYourNosh}knownosh2.png', // Replace with your actual image URL
                  width: 297.84,
                  height: 245,
                  placeholder:
                      (context, url) =>
                          const ShimmerLoading(width: 252, height: 421),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        // Second Image
        const SizedBox(height: 24),
      ],
    );
  }
}
