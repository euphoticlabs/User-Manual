import 'package:flutter/material.dart';

class UserManualDrawer extends StatelessWidget {
  final List<Section> sections;
  final Function(int, int) onSectionTap;
  const UserManualDrawer({super.key, required this.sections, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    // Layout constants
    const double dotRadius = 6.0;
    const double lineLeft = 28.0;
    const double sectionTitleHeight = 36.0;
    const double subSectionHeight = 28.0;
    const double sectionSpacing = 12.0;

    // Calculate the total height for the vertical line
    double totalHeight = 0;
    for (final section in sections) {
      totalHeight += sectionTitleHeight;
      totalHeight += section.subSections.length * subSectionHeight;
      totalHeight += sectionSpacing;
    }

    return Drawer(
      width: 320,
      child: Container(
        color: const Color(0xFFFF6B2C),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              // Timeline and menu
              Expanded(
                child: Stack(
                  children: [
                    // Vertical line
                    Positioned(
                      left: lineLeft,
                      top: sectionTitleHeight / 2,
                      child: Container(
                        width: 2,
                        height: totalHeight - sectionSpacing,
                        color: Colors.white,
                      ),
                    ),
                    // Menu content with dots
                    SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < sections.length; i++) ...[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 56,
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: dotRadius * 2,
                                      height: dotRadius * 2,
                                      decoration: BoxDecoration(
                                        color: sections[i].selected ? Colors.white : Colors.white.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => onSectionTap(i, -1), // -1 indicates section tap
                                      child: SizedBox(
                                        height: sectionTitleHeight,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            sections[i].title,
                                            style: TextStyle(
                                              color: sections[i].selected ? Colors.white : Colors.white.withOpacity(0.7),
                                              fontWeight: sections[i].selected ? FontWeight.bold : FontWeight.normal,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...sections[i].subSections.asMap().entries.map((entry) {
                                final subIndex = entry.key;
                                final sub = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 56),
                                  child: SizedBox(
                                    height: subSectionHeight,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () => onSectionTap(i, subIndex),
                                        child: _subSectionWidget(context, sub),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: sectionSpacing),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _subSectionWidget(BuildContext context, SubSection sub) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: sub.selected
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                sub.title,
                style: const TextStyle(
                  color: Color(0xFFFF6B2C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Row(
              children: [
                const Text("• ", style: TextStyle(color: Colors.white, fontSize: 16)),
                Text(
                  sub.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
    );
  }
}

class Section {
  final String title;
  final List<SubSection> subSections;
  bool selected;
  Section(this.title, [this.subSections = const [], this.selected = false]);
}

class SubSection {
  final String title;
  bool selected;
  SubSection(this.title, {this.selected = false});
}

class CustomDrawerIcon extends StatelessWidget {
  const CustomDrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B2C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Left rectangle
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 20,
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B2C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          // Right circle
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 20,
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B2C),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Custom icon in the middle
          Center(
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.menu,
                color: Color(0xFFFF6B2C),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
