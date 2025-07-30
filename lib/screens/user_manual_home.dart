import 'package:flutter/material.dart';
import 'package:user_manual/constants/styles.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/screens/widgets/drawer.dart';
import 'package:user_manual/constants/text_constants.dart';
import 'package:user_manual/utils/image_loader.dart';
import 'package:user_manual/widgets/cabinet_installation.dart';
import 'package:user_manual/widgets/chimney.dart';
import 'package:user_manual/widgets/cleaning.dart';
import 'package:user_manual/widgets/components.dart';
import 'package:user_manual/widgets/cooking.dart';
import 'package:user_manual/widgets/day_to_day_cleaning.dart';
import 'package:user_manual/widgets/four_months_cleaning.dart';
import 'package:user_manual/widgets/liquid.dart';
import 'package:user_manual/widgets/monthly_cleaning.dart';
import 'package:user_manual/widgets/pan.dart';
import 'package:user_manual/widgets/reference.dart';
import 'package:user_manual/widgets/safety.dart';
import 'package:user_manual/widgets/know_your_nosh_details.dart';
import 'package:user_manual/widgets/spice.dart';
import 'package:user_manual/widgets/stirrer.dart';
import 'package:user_manual/widgets/tray.dart';
import 'package:user_manual/widgets/induction.dart';
import 'package:user_manual/widgets/sensors.dart';
import 'package:user_manual/widgets/troubleshoot.dart';
import 'package:user_manual/utils/debouncer.dart';
import 'package:user_manual/widgets/support.dart';
import 'package:user_manual/widgets/warranty.dart';
import 'package:user_manual/widgets/firstaid.dart';

// Add lazy loading for widgets
class LazyLoadedWidget extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  
  const LazyLoadedWidget({
    super.key,
    required this.child,
    required this.isVisible,
  });

  @override
  State<LazyLoadedWidget> createState() => _LazyLoadedWidgetState();
}

class _LazyLoadedWidgetState extends State<LazyLoadedWidget> {
  bool _shouldBuild = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.isVisible && !_shouldBuild) {
      setState(() {
        _shouldBuild = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _shouldBuild ? widget.child : const SizedBox.shrink();
  }
}

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
  final GlobalKey _monthlyCleaningKey = GlobalKey();
  final GlobalKey _fourMonthsCleaningKey = GlobalKey();
  final GlobalKey _cabinetInstallationKey = GlobalKey();
  final GlobalKey _cookingKey = GlobalKey();
  final GlobalKey _safetyKey = GlobalKey();
  final GlobalKey _troubleshootKey = GlobalKey();
  final GlobalKey _referenceKey = GlobalKey();
  final GlobalKey _supportKey = GlobalKey();
  final GlobalKey _warrantyKey = GlobalKey();
  final GlobalKey _firstAidKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _isProgrammaticScroll = false;
  
  // Map to store section keys and their corresponding coordinates
  final Map<GlobalKey, ({int sectionIndex, int subIndex})> _sectionCoordinates = {};

  // Define your sections and subpoints
  final List<Section> sections = [
    Section(TextConstants.safety),
    Section(TextConstants.firstAid),
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
    Section(TextConstants.troubleshooting),
    Section(TextConstants.references),
    Section(TextConstants.support),
  ];

  final Debouncer _scrollDebouncer = Debouncer(delay: const Duration(milliseconds: 150));

  @override
  void initState() {
    super.initState();
    _sectionCoordinates[_safetyKey] = (sectionIndex: 0, subIndex: -1);
    _sectionCoordinates[_firstAidKey] = (sectionIndex: 1, subIndex: -1);
    _sectionCoordinates[_noshDetailsKey] = (sectionIndex: 2, subIndex: -1);
    _sectionCoordinates[_componentsKey] = (sectionIndex: 3, subIndex: -1);
    _sectionCoordinates[_spiceKey] = (sectionIndex: 3, subIndex: 0);
    _sectionCoordinates[_ingredientsKey] = (sectionIndex: 3, subIndex: 1);
    _sectionCoordinates[_liquidKey] = (sectionIndex: 3, subIndex: 2);
    _sectionCoordinates[_chimneyKey] = (sectionIndex: 3, subIndex: 3);
    _sectionCoordinates[_stirrerKey] = (sectionIndex: 3, subIndex: 4);
    _sectionCoordinates[_inductionKey] = (sectionIndex: 3, subIndex: 5);
    _sectionCoordinates[_panKey] = (sectionIndex: 3, subIndex: 6);
    _sectionCoordinates[_sensorsKey] = (sectionIndex: 3, subIndex: 7);
    _sectionCoordinates[_cleaningKey] = (sectionIndex: 4, subIndex: -1);
    _sectionCoordinates[_dayToDayCleaningKey] = (sectionIndex: 4, subIndex: 0);
    _sectionCoordinates[_monthlyCleaningKey] = (sectionIndex: 4, subIndex: 1);
    _sectionCoordinates[_fourMonthsCleaningKey] = (sectionIndex: 4, subIndex: 2);
    _sectionCoordinates[_cabinetInstallationKey] = (sectionIndex: 5, subIndex: -1);
    _sectionCoordinates[_cookingKey] = (sectionIndex: 6, subIndex: -1);
    _sectionCoordinates[_troubleshootKey] = (sectionIndex: 7, subIndex: -1);
    _sectionCoordinates[_referenceKey] = (sectionIndex: 8, subIndex: -1);
    _sectionCoordinates[_supportKey] = (sectionIndex: 9, subIndex: -1);
    // ...add more as needed
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _scrollDebouncer.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_isProgrammaticScroll) return;
    
    _scrollDebouncer.run(() {
      _updateVisibleSection();
    });
  }

  void _updateVisibleSection() {
    if (!mounted) return;
    
    // Find the most visible section using more efficient calculations
    double maxVisibility = 0;
    ({int sectionIndex, int subIndex})? mostVisibleSection;

    for (var entry in _sectionCoordinates.entries) {
      final context = entry.key.currentContext;
      if (context != null) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        final size = box.size;
        
        // Calculate visibility more efficiently
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
    if (mostVisibleSection != null && mounted) {
      setState(() {
        _updateSectionSelection(mostVisibleSection!.sectionIndex, mostVisibleSection.subIndex);
      });
    }
  }

  void _updateSectionSelection(int sectionIndex, int subIndex) {
    // Clear all selections
    for (final section in sections) {
      section.selected = false;
      for (final sub in section.subSections) {
        sub.selected = false;
      }
    }
    // Set the section as active
    sections[sectionIndex].selected = true;
    if (subIndex != -1) {
      sections[sectionIndex].subSections[subIndex].selected = true;
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
        _scrollToKey(_safetyKey);
      } else if (sectionIndex == 1) {
        _scrollToKey(_firstAidKey);
      } else if (sectionIndex == 2) {
        _scrollToKey(_noshDetailsKey);
      } else if (sectionIndex == 3) {
        _scrollToKey(_componentsKey);
      } else if (sectionIndex == 4) {
        _scrollToKey(_cleaningKey);
      } else if (sectionIndex == 5) {
        _scrollToKey(_cabinetInstallationKey);
      } else if (sectionIndex == 6) {
        _scrollToKey(_cookingKey);
      } else if (sectionIndex == 7) {
        _scrollToKey(_troubleshootKey);
      } else if (sectionIndex == 8) {
        _scrollToKey(_referenceKey);
      } else if (sectionIndex == 9) {
        _scrollToKey(_supportKey);
      }
    } else {
      // Subsection navigation
      if (sectionIndex == 3 && subIndex == 0) {
        _scrollToKey(_spiceKey);
      } else if (sectionIndex == 3 && subIndex == 1) {
        _scrollToKey(_ingredientsKey);
      } else if (sectionIndex == 3 && subIndex == 2) {
        _scrollToKey(_liquidKey);
      } else if (sectionIndex == 3 && subIndex == 3) {
        _scrollToKey(_chimneyKey);
      } else if (sectionIndex == 3 && subIndex == 4) {
        _scrollToKey(_stirrerKey);
      } else if (sectionIndex == 3 && subIndex == 5) {
        _scrollToKey(_inductionKey);
      } else if (sectionIndex == 3 && subIndex == 6) {
        _scrollToKey(_panKey);
      } else if (sectionIndex == 3 && subIndex == 7) {
        _scrollToKey(_sensorsKey);
      }
      else if (sectionIndex == 4 && subIndex == 0) {
        _scrollToKey(_dayToDayCleaningKey);
      } else if (sectionIndex == 4 && subIndex == 1) {
        _scrollToKey(_monthlyCleaningKey);
      } else if (sectionIndex == 4 && subIndex == 2) {
        _scrollToKey(_fourMonthsCleaningKey);
      }
    }
  }

  void _scrollToKey(GlobalKey key) {
    _isProgrammaticScroll = true;
    
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

  void scrollToSupport() {
    _scrollToKey(_supportKey);
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
                      const Positioned(
                        top: 20,
                        right: 15,
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ImageLoader(imagePath: '${R.homeS3bucket}home1.png', width: 100, height: 40, isNetwork: false),
                        ),
                      ),
                      const Positioned(
                        top: 124,
                        right: 0,
                        child: SizedBox(
                          width: 252,
                          height: 421,
                          child: ImageLoader(
                            imagePath: '${R.homeS3bucket}home2.png',
                            width: 252,
                            height: 421,
                            isNetwork: false,
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
                  onPressed: scrollToSupport,
                ),
                Support(key: _supportKey),
                // Warranty(key: _warrantyKey),
                FirstAid(key: _firstAidKey),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: KnowYourNoshDetailsWidget(key: _noshDetailsKey),
                ),
                ComponentsWidget(
                  key: _componentsKey,
                  onComponentTap: (componentKey) {
                    
                    switch (componentKey) {
                      case 'spice':
                        _updateSectionSelection(3, 0);
                        _scrollToKey(_spiceKey);
                        break;
                      case 'ingredients':
                        _updateSectionSelection(3, 1);
                        _scrollToKey(_ingredientsKey);
                        break;
                      case 'liquid':
                        _updateSectionSelection(3, 2);
                        _scrollToKey(_liquidKey);
                        break;
                      case 'chimney':
                        _updateSectionSelection(3, 3);
                        _scrollToKey(_chimneyKey);
                        break;
                      case 'stirrer':
                        _updateSectionSelection(3, 4);
                        _scrollToKey(_stirrerKey);
                        break;
                      case 'induction':
                        _updateSectionSelection(3, 5);
                        _scrollToKey(_inductionKey);
                        break;
                      case 'pan':
                        _updateSectionSelection(3, 6);
                        _scrollToKey(_panKey);
                        break;
                      case 'sensors':
                        _updateSectionSelection(3, 7);
                        _scrollToKey(_sensorsKey);
                        break;
                      default:
                        break;
                    }
                  },
                ),
                SpiceWidget(key: _spiceKey),
                TrayWidget(key: _ingredientsKey),
                LiquidWidget(key: _liquidKey),
                ChimneyWidget(key: _chimneyKey),
                StirrerWidget(key: _stirrerKey),
                InductionWidget(key: _inductionKey),
                PanWidget(key: _panKey),
                SensorsWidget(key: _sensorsKey),
                CleaningWidget(
                  key: _cleaningKey,
                  onCleaningTap: (cleaningKey) {
                    
                    switch (cleaningKey) {
                      case 'dayToDay':
                        _updateSectionSelection(4, 0);
                        _scrollToKey(_dayToDayCleaningKey);
                        break;
                      case 'monthly':
                        _updateSectionSelection(4, 1);
                        _scrollToKey(_monthlyCleaningKey);
                        break;
                      case 'fourMonths':
                        _updateSectionSelection(4, 2);
                        _scrollToKey(_fourMonthsCleaningKey);
                        break;
                      default:
                        break;
                    }
                  },
                ),
                DayToDayCleaning(key: _dayToDayCleaningKey),
                MonthlyCleaning(key: _monthlyCleaningKey),
                FourMonthsCleaning(key: _fourMonthsCleaningKey),
                CabinetInstallation(key: _cabinetInstallationKey),
                CookingWidget(key: _cookingKey),
                Safety(key: _safetyKey),
                Troubleshoot(key: _troubleshootKey),
                Reference(key: _referenceKey),
                
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
