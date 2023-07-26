import 'package:ClockSpotter/viewmodels/re_register_viewmodel.dart';
import 'package:ClockSpotter/views/Re-register%20Face/re_register_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/camerapic_viewmodel.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class ReRegisterFaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<ReRegisterFaceViewModel>(
      viewModel: ReRegisterFaceViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) =>  ReRegisterFaceMobilePortrait(),
          landscape: (context) => ReRegisterFaceMobilePortrait(),
        ),
        tablet:  ReRegisterFaceMobilePortrait(), desktop:  ReRegisterFaceMobilePortrait(),
      ),
    );
  }
}

class ReRegisterFaceSecondView extends StatelessWidget {
  const ReRegisterFaceSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
