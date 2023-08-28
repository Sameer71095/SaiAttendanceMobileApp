
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:show_update_dialog/show_update_dialog.dart';

import '../utils/app_color.dart';


class DrawerViewModel extends ChangeNotifier {

  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  String employeeName="";
  bool isLoading = false;
  int currentMonth=1;
  int currentYear=2023;

  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    title = 'initialised';
    DateTime now = DateTime.now();
    currentMonth = now.month; // This will give you the current month as an integer (e.g., 4)
    currentYear = now.year; // This will give you the current year as an integer (e.g., 2023)

    employeeName=constants.loginData.name!;
    // employeeName=  (await  storage.read(key: 'Name'))!;
    notifyListeners();

    verifyVersion();
    // verifyVersion();



  }
  verifyVersion() async {
    try {
      final versionCheck = ShowUpdateDialog(iOSId: 'com.rushtech360.clockspotter', androidId: 'com.rushtech360.clockspotter', iOSAppStoreCountry: 'AE');

      final VersionModel vs = await versionCheck.fetchVersionInfo();

      print('localVersion: ${vs.localVersion}');
      print('appStoreLink: ${vs.appStoreLink}');
      print('storeVersion: ${vs.storeVersion}');
      print('releaseNotes: ${vs.releaseNotes}');

      int typeDemo = 1; // 0 simples, 1 custom dialog, 2 override

      switch (typeDemo) {
        case 0:
          versionCheck.showSimplesDialog(context);
          break;
        case 1:
          versionCheck.showCustomDialogUpdate(
            context: context,
            versionStatus: vs,
            buttonText: "Update",
            buttonColor: Colors.green,
            forceUpdate: true,
            title: 'ClockSpotter',
            bodyoverride: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.update,
                      size: 150,
                      color: Colors.green,
                    ),
                  ],
                ),
                Text(
                  "Please update your app",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "Local version: ${vs.localVersion}",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "Store version: ${vs.storeVersion}",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 30),
                Text(
                  "${vs.releaseNotes}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
          break;
        case 2:
          var _releaseNotes = vs.releaseNotes!.replaceAll("<br>", "\n");
          versionCheck.showCustomDialogUpdate(
            context: context,
            versionStatus: vs,
            buttonText: "Update",
            buttonColor: Colors.green,
            bodyoverride: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.update,
                        size: 150,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Text(
                    "Please update your app",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    "Local version: ${vs.localVersion}",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Store version: ${vs.storeVersion}",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "${_releaseNotes}",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
          break;
        default:
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }







  int? pressedIndex;

  void toggleTileColor(int index) {
    pressedIndex=index;
    notifyListeners();
  }
}




