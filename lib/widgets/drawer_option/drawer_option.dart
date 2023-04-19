import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ClockSpotter/datamodels/drawer_item_data.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';

import 'drawer_option_mobile.dart';
import 'drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOption({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DrawerItemData(title: title, iconData: iconData),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          landscape: (context) => DrawerOptionMobileLandscape(),
          portrait: (context) => DrawerOptionMobilePortrait(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => DrawerOptionTabletPortrait(),
          landscape: (context) => DrawerOptionMobilePortrait(),
        ), desktop: DrawerOptionMobilePortrait(),
      ),
    );
  }
}
