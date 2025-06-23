import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/constants/styles.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/screens/widgets/drawer.dart';
import 'package:user_manual/constants/text_constants.dart';
import 'package:user_manual/widgets/components.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';
import 'package:user_manual/widgets/know_your_nosh_details.dart';
import 'package:user_manual/widgets/spice.dart';

class UserManualPage extends StatefulWidget {
  const UserManualPage({super.key});

  @override
  State<UserManualPage> createState() => _UserManualPageState();
}

class _UserManualPageState extends State<UserManualPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _noshDetailsKey = GlobalKey();
  final GlobalKey _componentsKey = GlobalKey();
  final GlobalKey _spiceKey = GlobalKey();
  final GlobalKey _ingredientsKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  
  // Map to store section keys and their corresponding indices
  final Map<GlobalKey, int> _sectionKeys = {};

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

  @override
  void initState() {
    super.initState();
    _sectionKeys[_noshDetailsKey] = 0;
    _sectionKeys[_componentsKey] = 1;
    _sectionKeys[_spiceKey] = 2; // For Spice subsection
    _sectionKeys[_ingredientsKey] = 3; // For Ingredients subsection
    // ...add more as needed
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // Find the most visible section
    double maxVisibility = 0;
    int? mostVisibleSectionIndex;

    for (var entry in _sectionKeys.entries) {
      final context = entry.key.currentContext;
      if (context != null) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        final size = box.size;
        
        // Calculate how much of the section is visible in the viewport
        final viewportHeight = MediaQuery.of(context).size.height;
        final visibleTop = position.dy.clamp(0, viewportHeight).toDouble();
        final visibleBottom = (position.dy + size.height).clamp(0, viewportHeight).toDouble();
        final visibleHeight = visibleBottom - visibleTop;
        
        if (visibleHeight > maxVisibility) {
          maxVisibility = visibleHeight;
          mostVisibleSectionIndex = entry.value;
        }
      }
    }

    // Update the active section if we found one
    if (mostVisibleSectionIndex != null) {
      setState(() {
        // Clear all selections
        for (final section in sections) {
          section.selected = false;
          for (final sub in section.subSections) {
            sub.selected = false;
          }
        }
        // Set the most visible section as active
        sections[mostVisibleSectionIndex!].selected = true;
      });
    }
  }

  void onSubSectionTap(int sectionIndex, int subIndex) {
    setState(() {
      for (final section in sections) {
        section.selected = false;
        for (final sub in section.subSections) {
          sub.selected = false;
        }
      }
      sections[sectionIndex].selected = true;
      if (subIndex != -1) {
        sections[sectionIndex].subSections[subIndex].selected = true;
      }
    });

    Navigator.of(context).pop();

    // Main section navigation
    if (subIndex == -1) {
      if (sectionIndex == 0) {
        scrollToNoshDetails();
      } else if (sectionIndex == 1) {
        scrollToComponents();
      }
      // Add more main sections as needed
    } else {
      // Subsection navigation
      if (sectionIndex == 1 && subIndex == 0) {
        _scrollToKey(_spiceKey);
      } else if (sectionIndex == 1 && subIndex == 1) {
        _scrollToKey(_ingredientsKey);
      }
      // Add more subsections as needed
    }
  }

  void _scrollToKey(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void scrollToNoshDetails() {
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

  void scrollToComponents() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _componentsKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void scrollToSpice() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _spiceKey.currentContext;
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
                ComponentsWidget(key: _componentsKey),
                SpiceWidget(key: _spiceKey),
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
