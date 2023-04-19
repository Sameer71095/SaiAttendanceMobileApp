import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/registerface_viewmodel.dart';
import 'package:ClockSpotter/views/registerface/registerface_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class RegisterFaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<RegisterFaceViewModel>(
      viewModel: RegisterFaceViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => RegisterFaceMobilePortrait(),
          landscape: (context) => RegisterFaceMobilePortrait(),
        ),
        tablet: RegisterFaceMobilePortrait(), desktop: RegisterFaceMobilePortrait(),
      ),
    );
  }
}

class RegisterFaceSecondView extends StatelessWidget {
  const RegisterFaceSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
