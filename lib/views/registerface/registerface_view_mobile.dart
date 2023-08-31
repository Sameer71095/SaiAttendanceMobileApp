/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'dart:io';

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ClockSpotter/viewmodels/registerface_viewmodel.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'package:flutter_svg/svg.dart';


class RegisterFaceMobilePortrait extends BaseModelWidget<RegisterFaceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RegisterFaceViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children:[
        Container(
          decoration: BoxDecoration(
              color: AppColor.backgroundColor
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     alignment: Alignment.center,
            //     image: AssetImage('assets/images/background/back.jpg'))
          ),
        ),
          FutureBuilder<void>(
            future: model.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child:   ClipOval(
                    child: CameraPreview(model.controller),
                  ),);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          // Add the following Column widget
          Column(
            children: [
              SizedBox(height:  (height * 0.05) * 1.3),
              Center(
                child: Text(
                  'Register Your Face',
                  style: TextStyle(
                    color: AppColor.textColorWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            /*  SizedBox(height: 8),
              Center(
                child: Text(
                  'We need 4 images to register your face:',
                  style: TextStyle(fontSize: 18),
                ),
              ),*/
              SizedBox(height: 8),
              Center(
                child: Text(
                  model.directions[model.currentStep],
                  style: TextStyle(
                    color: AppColor.textColorWhite,

                    fontSize: 16,fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          Positioned(
            top: (height * 0.05) / 2,
            left: (height * 0.05) / 2,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.menuIconColor,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColor.textColorBlack),
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
            child:  model.isLoading? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                  },
                  backgroundColor: AppColor.backgroundContainer,
                  child:  Center(
                    child: CircularProgressIndicator(color: AppColor.backgroundColor),
                  ),
                ),
              ],
            ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    try {
                      model.isLoading = true;
                      model.notifyListeners();
                      await model.initializeControllerFuture;
                      final image = await model.controller.takePicture();
                      File imageFile = await model.GenerateOptimizedFile(image);
                      model.onCaptureClick(imageFile);
                      print('Image saved at: ${imageFile.path}');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Icon(Icons.camera, size: 30,color: AppColor.backgroundColor ),
                    backgroundColor:AppColor.backgroundContainer
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
