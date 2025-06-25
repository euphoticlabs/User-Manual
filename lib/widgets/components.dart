import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';

class ComponentsWidget extends StatelessWidget {
  final void Function(String componentKey)? onComponentTap;

  const ComponentsWidget({super.key, this.onComponentTap});

  @override
  Widget build(BuildContext context) {
    final components = [
      {'label': 'Spice', 'image': '${R.components}spice.png', 'key': 'spice'},
      {'label': 'Ingredients', 'image': '${R.components}ingredients.png', 'key': 'ingredients'},
      {'label': 'Oil & Water', 'image': '${R.components}liquid.png', 'key': 'liquid'},
      {'label': 'Chimney', 'image': '${R.components}chimney.png', 'key': 'chimney'},
      {'label': 'Stirrer', 'image': '${R.components}stirrer.png', 'key': 'stirrer'},
      {'label': 'Induction', 'image': '${R.components}induction.png', 'key': 'induction'},
      {'label': 'Pan', 'image': '${R.components}pan.png', 'key': 'pan'},
      {'label': 'Sensors', 'image': '${R.components}sensors.png', 'key': 'sensors'},
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Components',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              ...components.map(
                (comp) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Component tapped: ${comp['key']}');
                      if (onComponentTap != null) {
                        onComponentTap!(comp['key']!);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFFF6B2C)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: comp['image']!,
                            width: 34,
                            height: 30,
                            placeholder: (context, url) =>
                                const ShimmerLoading(width: 252, height: 421),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              comp['label']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
