/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sai_attendance/viewmodels/camerapic_viewmodel.dart';
import 'package:sai_attendance/views/camerapic/camerapic_view.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';
import 'package:sai_attendance/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image/image.dart' as img;


class CameraPicMobilePortrait extends BaseModelWidget<CameraPicViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, CameraPicViewModel model) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: model.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return OverflowBox(
                  minHeight: MediaQuery.of(context).size.height,
                  maxHeight: MediaQuery.of(context).size.height,
                  child: Transform.scale(
                    scale: MediaQuery.of(context).size.height /
                        (MediaQuery.of(context).size.width / model.controller.value.aspectRatio)/3,
                    child: AspectRatio(
                      aspectRatio: model.controller.value.aspectRatio,
                      child: CameraPreview(model.controller),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            top: (height * 0.05) / 2,
            left: (height * 0.05) / 2,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.brown,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    try {
                      await model.initializeControllerFuture;
                      final image = await model.controller.takePicture();
                      File imageFile = await model.GenerateOptimizedFile(image);
                      model.onCaptureClick(imageFile);
                      print('Image saved at: ${imageFile.path}');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Icon(Icons.camera, size: 30, color: Colors.white),
                  backgroundColor: Colors.brown,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(
      msg,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
    ),
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
