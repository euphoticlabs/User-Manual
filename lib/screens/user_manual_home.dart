import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/screens/widgets/drawer.dart';

class UserManualPage extends StatefulWidget {
  const UserManualPage({super.key});

  @override
  State<UserManualPage> createState() => _UserManualPageState();
}

class _UserManualPageState extends State<UserManualPage> {
  // Define your sections and subpoints
  final List<Section> sections = [
    Section("Know Your Nosh"),
    Section("Components", [
      SubSection("Spice"),
      SubSection("Ingredients"),
      SubSection("Oil & Water"),
      SubSection("Chimney"),
      SubSection("Stirrer"),
      SubSection("Induction"),
      SubSection("Pan"),
      SubSection("Sensors"),
    ]),
    Section("Cleaning", [
      SubSection("Day to Day Cleaning"),
      SubSection("Monthly Cleaning"),
      SubSection("Every 4 Months"),
    ]),
    Section("Cabinet Installation"),
    Section("Cooking"),
    Section("Safety"),
    Section("Troubleshooting"),
    Section("Refences"),
  ];

  void onSubSectionTap(int sectionIndex, int subIndex) {
    setState(() {
      // Clear all selections
      for (final section in sections) {
        section.selected = false;
        for (final sub in section.subSections) {
          sub.selected = false;
        }
      }
      
      // Set the tapped section as selected
      sections[sectionIndex].selected = true;
      
      // If a subsection was tapped (subIndex != -1), set it as selected
      if (subIndex != -1) {
        sections[sectionIndex].subSections[subIndex].selected = true;
      }
    });
    // Close the drawer after selection
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manual'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const CustomDrawerIcon(),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: UserManualDrawer(
        sections: sections,
        onSectionTap: onSubSectionTap,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome to the User Manual!',
              style: TextStyle(fontSize: 24),
            ),
            CachedNetworkImage(
              imageUrl: 'https://nosh-user-manual.s3.ap-south-1.amazonaws.com/nosh.png',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}


