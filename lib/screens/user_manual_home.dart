import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/constants/styles.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/screens/widgets/drawer.dart';
import 'package:user_manual/constants/text_constants.dart';
import 'package:user_manual/widgets/chimney.dart';
import 'package:user_manual/widgets/cleaning.dart';
import 'package:user_manual/widgets/components.dart';
import 'package:user_manual/widgets/day_to_day_cleaning.dart';
import 'package:user_manual/widgets/liquid.dart';
import 'package:user_manual/widgets/pan.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';
import 'package:user_manual/widgets/know_your_nosh_details.dart';
import 'package:user_manual/widgets/spice.dart';
import 'package:user_manual/widgets/stirrer.dart';
import 'package:user_manual/widgets/tray.dart';
import 'package:user_manual/widgets/induction.dart';
import 'package:user_manual/widgets/sensors.dart';

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
  final GlobalKey _liquidKey = GlobalKey();
  final GlobalKey _chimneyKey = GlobalKey();
  final GlobalKey _stirrerKey = GlobalKey();
  final GlobalKey _inductionKey = GlobalKey();
  final GlobalKey _panKey = GlobalKey();
  final GlobalKey _sensorsKey = GlobalKey();
  final GlobalKey _cleaningKey = GlobalKey();
  final GlobalKey _dayToDayCleaningKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _isProgrammaticScroll = false;
  
  // Map to store section keys and their corresponding coordinates
  final Map<GlobalKey, ({int sectionIndex, int subIndex})> _sectionCoordinates = {};

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
    _sectionCoordinates[_noshDetailsKey] = (sectionIndex: 0, subIndex: -1);
    _sectionCoordinates[_componentsKey] = (sectionIndex: 1, subIndex: -1);
    _sectionCoordinates[_spiceKey] = (sectionIndex: 1, subIndex: 0);
    _sectionCoordinates[_ingredientsKey] = (sectionIndex: 1, subIndex: 1);
    _sectionCoordinates[_liquidKey] = (sectionIndex: 1, subIndex: 2);
    _sectionCoordinates[_chimneyKey] = (sectionIndex: 1, subIndex: 3);
    _sectionCoordinates[_stirrerKey] = (sectionIndex: 1, subIndex: 4);
    _sectionCoordinates[_inductionKey] = (sectionIndex: 1, subIndex: 5);
    _sectionCoordinates[_panKey] = (sectionIndex: 1, subIndex: 6);
    _sectionCoordinates[_sensorsKey] = (sectionIndex: 1, subIndex: 7);
    _sectionCoordinates[_cleaningKey] = (sectionIndex: 2, subIndex: -1);
    _sectionCoordinates[_dayToDayCleaningKey] = (sectionIndex: 2, subIndex: 0);
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
    if (_isProgrammaticScroll) return;
    // Find the most visible section
    double maxVisibility = 0;
    ({int sectionIndex, int subIndex})? mostVisibleSection;

    for (var entry in _sectionCoordinates.entries) {
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
          mostVisibleSection = entry.value;
        }
      }
    }

    // Update the active section if we found one
    if (mostVisibleSection != null) {
      setState(() {
        // Clear all selections
        for (final section in sections) {
          section.selected = false;
          for (final sub in section.subSections) {
            sub.selected = false;
          }
        }
        // Set the most visible section as active
        final coords = mostVisibleSection;
        if (coords != null) {
          sections[coords.sectionIndex].selected = true;
          if (coords.subIndex != -1) {
            sections[coords.sectionIndex]
                .subSections[coords.subIndex]
                .selected = true;
          }
        }
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
        _scrollToKey(_noshDetailsKey);
      } else if (sectionIndex == 1) {
        _scrollToKey(_componentsKey);
      } else if (sectionIndex == 2) {
        _scrollToKey(_cleaningKey);
      }
      // Add more main sections as needed
    } else {
      // Subsection navigation
      if (sectionIndex == 1 && subIndex == 0) {
        _scrollToKey(_spiceKey);
      } else if (sectionIndex == 1 && subIndex == 1) {
        _scrollToKey(_ingredientsKey);
      } else if (sectionIndex == 1 && subIndex == 2) {
        _scrollToKey(_liquidKey);
      } else if (sectionIndex == 1 && subIndex == 3) {
        _scrollToKey(_chimneyKey);
      } else if (sectionIndex == 1 && subIndex == 4) {
        _scrollToKey(_stirrerKey);
      } else if (sectionIndex == 1 && subIndex == 5) {
        _scrollToKey(_inductionKey);
      } else if (sectionIndex == 1 && subIndex == 6) {
        _scrollToKey(_panKey);
      } else if (sectionIndex == 1 && subIndex == 7) {
        _scrollToKey(_sensorsKey);
      }
      else if (sectionIndex == 2 && subIndex == 0) {
        _scrollToKey(_dayToDayCleaningKey);
      }
      // Add more subsections as needed
    }
  }

  void _scrollToKey(GlobalKey key) {
    _isProgrammaticScroll = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ).whenComplete(() {
          Future.delayed(const Duration(milliseconds: 500), () {
            _isProgrammaticScroll = false;
          });
        });
      } else {
        _isProgrammaticScroll = false;
      }
    });
  }

  void scrollToNoshDetails() {
    _scrollToKey(_noshDetailsKey);
  }

  void scrollToComponents() {
    _scrollToKey(_componentsKey);
  }

  void scrollToSpice() {
    _scrollToKey(_spiceKey);
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
                TrayWidget(key: _ingredientsKey),
                LiquidWidget(key: _liquidKey),
                ChimneyWidget(key: _chimneyKey),
                StirrerWidget(key: _stirrerKey),
                InductionWidget(key: _inductionKey),
                PanWidget(key: _panKey),
                SensorsWidget(key: _sensorsKey),
                CleaningWidget(key: _cleaningKey),
                DayToDayCleaning(key: _dayToDayCleaningKey),
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
