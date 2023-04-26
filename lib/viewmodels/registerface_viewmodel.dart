

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/main.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:image/image.dart' as img;

class RegisterFaceViewModel extends ChangeNotifier {
  String title = 'default';

  bool isLoading = false;
  late CameraController controller;
  late Future<void> initializeControllerFuture;

  int currentCameraIndex = 0;
  OverlayEntry? overlayEntry;
  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    currentCameraIndex = cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    if (currentCameraIndex == -1) {
      currentCameraIndex = 0; // Default to the first camera if a front camera is not available
    }
    initializeCamera(currentCameraIndex);
    notifyListeners();
  }
  void initializeCamera(int cameraIndex) {

    controller = CameraController(cameras[cameraIndex], ResolutionPreset.medium, imageFormatGroup: ImageFormatGroup.jpeg);
    initializeControllerFuture = controller.initialize();
    notifyListeners();
  }
  void switchCamera() {
    currentCameraIndex = currentCameraIndex == cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front) ? cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.back) : cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    controller.dispose();
    initializeCamera(currentCameraIndex);
  }
  List<File?> capturedImages = [];
  int currentStep = 0;
  bool faceDetected=false;
  List<String> directions = [
    'Look straight',
    'Turn your head a little to the right',
    'Turn your head a little to the left',
    'Tilt your head a little up',
    'Tilt your head a little down',
  ];

  final storage = const FlutterSecureStorage();
  Future<void> onCaptureClick(File? image) async {
    try{
      if (image == null) {
        print("Error capturing image: Image is null");

        showToast("Error capturing image");
        isLoading = false;
        notifyListeners();
        return;
      }
      capturedImages.add(image);
      currentStep++;
      if(currentStep>2){
        storage.read(key: 'EmployeeId').then((value) async {
          String? employeeId=value;
          if (employeeId == null) {
            print("Error: EmployeeId is null");
            showToast("Please Login Again");
            isLoading = false;
            notifyListeners();
            return;
          }
          // Show loading indicator
          overlayEntry = _buildLoadingOverlay(context);
          Overlay.of(context).insert(overlayEntry!);
          try{
            clientPython.RegisterEmployeeImages(employeeId,capturedImages).then((response) {
              if(response.status==200) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                        child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              }  else {

                showToast("Server Error, please try again later");
                isLoading = false;
                print("Error: API returned status ${response.status}");
                notifyListeners();
                // Show error message to user
              }
            });
          } catch (exception, stackTrace) {

            showToast("Error on registering image, please contact support");
            isLoading = false;
            await Sentry.captureException(
              exception,
              stackTrace: stackTrace,
            );
            print("Error calling API: $exception");
            notifyListeners();
            // Show error message to user
          } finally {

            isLoading = false;
            overlayEntry?.remove();
            overlayEntry = null;
            notifyListeners();
          }
        });
        /* String employeeId='1';*/
      }
      else{
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {


      showToast("Error capturing image");
      isLoading = false;
      notifyListeners();
    }


    // notifyListeners();
  }

  Future<File> GenerateOptimizedFile(XFile image) async {
    final bytes = await image.readAsBytes();
    final decodedImage = img.decodeImage(bytes);
    final normalizedImage = img.copyResize(decodedImage!, width: 224);
    final grayscaleImage = img.grayscale(normalizedImage);
    final normalizedBytes = img.encodeJpg(grayscaleImage);

    // Save the normalized image
    final tempDir = await getTemporaryDirectory();
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final File imageFile = File('${tempDir.path}/$fileName.jpg');
    await imageFile.writeAsBytes(normalizedBytes);
    // Save the captured image to the file
    // await imageFile.writeAsBytes(await image.readAsBytes());
    return imageFile;
  }
/* void onFaceDetected(bool isFaceDetected) {
    faceDetected=isFaceDetected;
    notifyListeners();
  }*/

  OverlayEntry _buildLoadingOverlay(BuildContext context) {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    });
  }

}
