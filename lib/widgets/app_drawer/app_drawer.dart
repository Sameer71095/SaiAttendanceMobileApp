import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:ClockSpotter/widgets/drawer_option/drawer_option.dart';

import 'app_drawer_tablet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: (context) => AppDrawerTabletPortrait(),
        landscape: (context) => AppDrawerTabletLandscape(),
      ), desktop: AppDrawerTabletLandscape(),
    );
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Images',
        iconData: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        iconData: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}
