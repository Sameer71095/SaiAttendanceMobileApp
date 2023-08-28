/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'dart:io';
import 'dart:math';

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/re_register_viewmodel.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ClockSpotter/viewmodels/camerapic_viewmodel.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image/image.dart' as img;
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:vector_math/vector_math.dart' as vmath;


class ReRegisterFaceMobilePortrait extends BaseModelWidget<ReRegisterFaceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ReRegisterFaceViewModel model) {
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        drawer: DrawerView(),
        body: Stack(
          children: [
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
                double progress = 0.5; // Example progress value
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(



                     child: ClipOval(
                           child: CameraPreview(model.controller),
                        ),






                  );
                } else {
                  return Center(child: CircularProgressIndicator(color: AppColor.iconColor,));
                }
              },
            ),
            // Positioned(
            //   top: (height * 0.3) / 2,
            //   left: (height * 0.05) / 2,
            //   child: SafeArea(
            //     child: Container(
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.brown,
            //       ),
            //       child: IconButton(
            //         icon: Icon(Icons.arrow_back, color: Colors.white),
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //       ),
            //     ),
            //   ),
            // ),

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
                    backgroundColor: Colors.brown,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
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
                        // model.onCaptureClick(imageFile);
                        // print('Image saved at: ${imageFile.path}');
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Icon(Icons.camera, size: 30, color:AppColor.iconColor ),
                    backgroundColor:AppColor.primaryColor
                  ),
                ],
              ),
            ),
            Positioned(

              child: AppBar(
                iconTheme: IconThemeData(color: AppColor.menuIconColor,size: 28),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(),
                title: Text(
                  'Re-register your face',
                  style: theme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
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

class ReRegisterFaceMobileLandscape extends BaseModelWidget<ReRegisterFaceViewModel> {
  @override
  Widget build(BuildContext context,ReRegisterFaceViewModel model) {
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




