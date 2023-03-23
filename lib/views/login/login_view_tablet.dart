import 'package:flutter/material.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';

class LoginViewTablet extends StatelessWidget {
  const LoginViewTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer()
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(children: children)
          : Row(children: children.reversed.toList()),
    );
  }
}
