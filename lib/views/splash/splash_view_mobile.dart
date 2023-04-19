/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/splash_viewmodel.dart';
import 'package:ClockSpotter/views/splash/splash_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class SplashMobilePortrait extends BaseModelWidget<SplashViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, SplashViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: height,
                child: Image.asset(
                  'assets/images/splash/bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashMobileLandscape extends BaseModelWidget<SplashViewModel> {
  @override
  Widget build(BuildContext context, SplashViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SplashSecondView(key: new Key("test"),)));
        },
      ),
      body: Row(
        children: <Widget>[
          AppDrawer(),
          Expanded(
            child: Center(
              child: Text(
                model.title,
                style: TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
