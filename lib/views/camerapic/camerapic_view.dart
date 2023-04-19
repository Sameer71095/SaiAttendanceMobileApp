import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/camerapic_viewmodel.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class CameraPicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<CameraPicViewModel>(
      viewModel: CameraPicViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => CameraPicMobilePortrait(),
          landscape: (context) => CameraPicMobilePortrait(),
        ),
        tablet: CameraPicMobilePortrait(), desktop: CameraPicMobilePortrait(),
      ),
    );
  }
}

class CameraPicSecondView extends StatelessWidget {
  const CameraPicSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
