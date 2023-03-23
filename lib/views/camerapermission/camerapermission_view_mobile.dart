/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:flutter/material.dart';
import 'package:sai_attendance/views/camerapermission/camerapermission_view.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';
import 'package:sai_attendance/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../viewmodels/camerapermission_viewmodel.dart';


class CameraPermissionMobilePortrait extends BaseModelWidget<CameraPermissionViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, CameraPermissionViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: height,
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)

          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      width: double.infinity,
                      height: height,
                      child: Image.asset(
                        'assets/images/permission/bg.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height - 310.0, left: 40.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 19.0),
                          ),
                          const Text(
                            "Camera Access",
                            style: TextStyle(
                                fontFamily: "Popins",
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                letterSpacing: 1.5),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                          ),
                          const Text(
                            "Please allow access to your \ncamera to take photos",
                            style: TextStyle(
                                fontFamily: "Sofia",
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          InkWell(
                            onTap: () {
                             model.requestCameraPermission();
                            },
                            child: Container(
                              height: 45.0,
                              width: 130.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                              child: const Center(
                                child: Text(
                                  "Allow",
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SplashMobileLandscape extends BaseModelWidget<CameraPermissionViewModel> {
  @override
  Widget build(BuildContext context, CameraPermissionViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CameraPermissionSecondView(key: new Key("test"),)));
        },
      ),
      body: Row(
        children: <Widget>[
          const AppDrawer(),
          Expanded(
            child: Center(
              child: Text(
                model.title,
                style: const TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
