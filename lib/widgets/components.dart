import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/utils/image_loader.dart';

class ComponentsWidget extends StatelessWidget {
  final void Function(String componentKey)? onComponentTap;

  const ComponentsWidget({super.key, this.onComponentTap});

  @override
  Widget build(BuildContext context) {
    final components = [
      {'label': 'Spice', 'image': '${R.components}spice.png', 'key': 'spice'},
      {
        'label': 'Ingredients',
        'image': '${R.components}ingredients.png',
        'key': 'ingredients',
      },
      {
        'label': 'Oil & Water',
        'image': '${R.components}liquid.png',
        'key': 'liquid',
      },
      {
        'label': 'Chimney',
        'image': '${R.components}chimney.png',
        'key': 'chimney',
      },
      {
        'label': 'Stirrer',
        'image': '${R.components}stirrer.png',
        'key': 'stirrer',
      },
      {
        'label': 'Induction',
        'image': '${R.components}induction.png',
        'key': 'induction',
      },
      {'label': 'Pan', 'image': '${R.components}pan.png', 'key': 'pan'},
      {
        'label': 'Sensors',
        'image': '${R.components}sensors.png',
        'key': 'sensors',
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Components',
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
              const SizedBox(height: 50),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 140 / 130, // 130 width / 140 height
                ),
                itemCount: components.length,
                itemBuilder: (context, index) {
                  final comp = components[index];
                  return GestureDetector(
                    onTap: () {
                      if (onComponentTap != null) {
                        onComponentTap!(comp['key']!);
                      }
                    },
                    child: Container(
                      width: 140,
                      height: 130,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          width: 2,
                        ),

                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageLoader(
                            imagePath: comp['image']!,
                            width: 70,
                            height: 60,
                            isNetwork: false,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            comp['label']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
