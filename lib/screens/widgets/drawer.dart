import 'package:flutter/material.dart';

class UserManualDrawer extends StatelessWidget {
  final List<Section> sections;
  final Function(int, int) onSectionTap;
  const UserManualDrawer({super.key, required this.sections, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    const double dotRadius = 8.0; // Increased dot size
    const double lineLeft = 32.0; // Adjusted line position
    const double sectionTitleHeight = 40.0; // Increased height
    const double subSectionHeight = 32.0; // Increased height
    const double sectionSpacing = 16.0; // Increased spacing

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
              Expanded(
                child: Stack(
                  children: [
                    // Vertical line
                    Positioned(
                      left: lineLeft,
                      top: sectionTitleHeight / 2,
                      child: Container(
                        width: 3, // Thicker line
                        height: totalHeight - sectionSpacing,
                        color: Colors.white,
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < sections.length; i++) ...[
                              // Main section
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64, // Increased width for better alignment
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: dotRadius * 2,
                                      height: dotRadius * 2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => onSectionTap(i, -1),
                                      child: SizedBox(
                                        height: sectionTitleHeight,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            sections[i].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                                  padding: const EdgeInsets.only(left: 64), // Align with dot
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
                              const SizedBox(height: sectionSpacing),
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
    const double pillHeight = 32.0; // Match subSectionHeight
    return SizedBox(
      height: pillHeight,
      child: Align(
        alignment: Alignment.centerLeft,
        child: sub.selected
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Dot before the text
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: const BoxDecoration(
                        color: Colors.black, // or Colors.orange if you want
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      sub.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  const Text("• ", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text(
                    sub.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
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
      width: 45,
      height: 80,
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
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B2C),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/drawer_icon.png',
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
