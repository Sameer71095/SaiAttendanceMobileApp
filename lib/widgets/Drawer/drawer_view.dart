import 'package:ClockSpotter/viewmodels/drawer_viewmodel.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';



class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<DrawerViewModel>(
      viewModel: DrawerViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => DrawerMobilePotrait(),
          landscape: (context) => DrawerMobilePotrait(),
        ),
        tablet: DrawerMobilePotrait(), desktop: DrawerMobilePotrait(),
      ),
    );
  }
}

class SecondViewHome extends StatelessWidget {
  const SecondViewHome({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
