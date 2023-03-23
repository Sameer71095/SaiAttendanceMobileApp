/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sai_attendance/viewmodels/camerapic_viewmodel.dart';
import 'package:sai_attendance/views/camerapic/camerapic_view.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';
import 'package:sai_attendance/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class CameraPicMobilePortrait extends BaseModelWidget<CameraPicViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, CameraPicViewModel model) {
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
        body: Builder(builder: (context) {
          if (model.capturedImage != null) {
            return Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [

                  Image.file(
                    model.capturedImage!,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle container click
                      model.onCaptureAgainClick();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: HexColor('#f56624'),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:   Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor('484948'),
                        ),
                        child:  Center(
                          child: Text(model.userName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),),),
                  LoadingAnimationWidget.dotsTriangle(
                    color: HexColor('f47320'),
                    size: 100,
                  ),
                ],
              ),
            );
          }
          return SmartFaceCamera(
              autoCapture: true,
              defaultCameraLens: CameraLens.front,
              onCapture: (File? image) {
                model.onCaptureClick(image);
              },
              onFaceDetected: (Face? face) {
                //Do something
              },
              messageBuilder: (context, face) {
                if (face == null) {
                  return _message('Place your face in the camera');
                }
                if (!face.wellPositioned) {
                  return _message('Center your face in the square');
                }
                return const SizedBox.shrink();
              });
        }));
  }
  Widget _message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
  );
}

class CameraPicMobileLandscape extends BaseModelWidget<CameraPicViewModel> {
  @override
  Widget build(BuildContext context, CameraPicViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CameraPicSecondView(key: new Key("test"),)));
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
