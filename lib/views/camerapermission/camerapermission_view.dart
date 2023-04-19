import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/camerapermission_viewmodel.dart';
import 'package:ClockSpotter/views/camerapermission/camerapermission_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


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
