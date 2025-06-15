import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/constants/styles.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/screens/widgets/drawer.dart';
import 'package:user_manual/constants/text_constants.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';
import 'package:user_manual/widgets/know_your_nosh_details.dart';

class UserManualPage extends StatefulWidget {
  const UserManualPage({super.key});

  @override
  State<UserManualPage> createState() => _UserManualPageState();
}

class _UserManualPageState extends State<UserManualPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _noshDetailsKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  // Define your sections and subpoints
  final List<Section> sections = [
    Section(TextConstants.knowYourNosh),
    Section(TextConstants.components, [
      SubSection(TextConstants.spice),
      SubSection(TextConstants.ingredients),
      SubSection(TextConstants.oilAndWater),
      SubSection(TextConstants.chimney),
      SubSection(TextConstants.stirrer),
      SubSection(TextConstants.induction),
      SubSection(TextConstants.pan),
      SubSection(TextConstants.sensors),
    ]),
    Section(TextConstants.cleaning, [
      SubSection(TextConstants.dayToDayCleaning),
      SubSection(TextConstants.monthlyCleaning),
      SubSection(TextConstants.everyFourMonths),
    ]),
    Section(TextConstants.cabinetInstallation),
    Section(TextConstants.cooking),
    Section(TextConstants.safety),
    Section(TextConstants.troubleshooting),
    Section(TextConstants.references),
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

    // If "Know your Nosh" section is tapped, scroll to details
    if (sectionIndex == 0) {
      scrollToNoshDetails();
    }
  }

  void scrollToNoshDetails() {
    // Wait for the next frame to ensure the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _noshDetailsKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: UserManualDrawer(
        sections: sections,
        onSectionTap: onSubSectionTap,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height-127,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 15,
                        child: SizedBox(
                          width: 75,
                          height: 30,
                          child: CachedNetworkImage(
                            imageUrl: '${R.homeS3bucket}home1.png',
                            placeholder:
                                (context, url) =>
                                    const ShimmerLoading(width: 75, height: 30),
                            errorWidget:
                                (context, url, error) =>
                                    const Icon(Icons.error),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 124,
                        right: 0,
                        child: SizedBox(
                          width: 252,
                          height: 421,
                          child: CachedNetworkImage(
                            imageUrl: '${R.homeS3bucket}home2.png',
                            placeholder:
                                (context, url) => const ShimmerLoading(
                                  width: 252,
                                  height: 421,
                                ),
                            errorWidget:
                                (context, url, error) =>
                                    const Icon(Icons.error),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 629,
                        right: 14,
                        child: SizedBox(
                          width: 172,
                          height: 29,
                          child: Text(
                            TextConstants.appTitle,
                            style: TextStyles.interLight24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.keyboard_double_arrow_down, size: 36, color: Colors.grey),
                  onPressed: scrollToNoshDetails,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: KnowYourNoshDetailsWidget(key: _noshDetailsKey),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 0,
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: const CustomDrawerIcon(),
            ),
          ),
        ],
      ),
    );
  }
}
