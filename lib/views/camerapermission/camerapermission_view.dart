import 'package:flutter/material.dart';
import 'package:sai_attendance/responsive/orientation_layout.dart';
import 'package:sai_attendance/responsive/screen_type_layout.dart';
import 'package:sai_attendance/viewmodels/camerapermission_viewmodel.dart';
import 'package:sai_attendance/views/camerapermission/camerapermission_view_mobile.dart';
import 'package:sai_attendance/widgets/base_widget.dart';


class CameraPermissionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<CameraPermissionViewModel>(
      viewModel: CameraPermissionViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => CameraPermissionMobilePortrait(),
          landscape: (context) => CameraPermissionMobilePortrait(),
        ),
        tablet: CameraPermissionMobilePortrait(), desktop: CameraPermissionMobilePortrait(),
      ),
    );
  }
}

class CameraPermissionSecondView extends StatelessWidget {
  const CameraPermissionSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
