/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sai_attendance/viewmodels/registerface_viewmodel.dart';
import 'package:sai_attendance/views/registerface/registerface_view.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';
import 'package:sai_attendance/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:face_camera/face_camera.dart';
import 'package:flutter_svg/svg.dart';


class RegisterFaceMobilePortrait extends BaseModelWidget<RegisterFaceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RegisterFaceViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SmartFaceCamera(
                autoCapture: false,
                defaultCameraLens: CameraLens.front,
                onCapture: (File? image) {
                  model.onCaptureClick(image);
                  _showPopup(model, context);
                },
                imageResolution: ImageResolution.high, // Change the imageResolution to high or low
                onFaceDetected: (Face? face) {
                  // Show popup and rebuild the UI after 2 seconds

                  // Do something
                },
                messageBuilder: (context, face) {
                  if (face == null) {
                    return _message('Place your face in the camera');
                  }
                  if (!face.wellPositioned) {
                    return _message(model.directions[model.currentStep]);
                  }
                  return const SizedBox.shrink();
                }),
          ),
        ],
      ),
    );
  }

  Widget _message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
  );



  void _showPopup(RegisterFaceViewModel model, BuildContext context) {
    if (model.currentStep >= model.directions.length) return;

    model.overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace 'your_gif_asset.gif' with the actual path to your GIF asset
                Image.asset('assets/images/gif/face.gif'),
                /* Text(
                  model.directions[model.currentStep],
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),*/
              ],
            ),
          ),
        ],
      );
    });

    Overlay.of(context).insert(model.overlayEntry!);
    Future.delayed(const Duration(seconds: 2), () {
      model.overlayEntry?.remove();
      model.overlayEntry = null;
      model.notifyListeners();
    });
  }


}

class RegisterFaceMobileLandscape extends BaseModelWidget<RegisterFaceViewModel> {
  @override
  Widget build(BuildContext context, RegisterFaceViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterFaceSecondView(key: new Key("test"),)));
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
