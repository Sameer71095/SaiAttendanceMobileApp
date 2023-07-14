import 'package:ClockSpotter/viewmodels/forgot_viewmodel.dart';
import 'package:ClockSpotter/views/forgot%20password/forgot_password_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class ForgotView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<ForgotViewModel>(
      viewModel: ForgotViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => ForgotMobilePortrait(),
          landscape: (context) => ForgotMobilePortrait(),
        ),
        tablet: ForgotMobilePortrait(), desktop:  ForgotMobilePortrait(),
      ),
    );
  }
}

class ForgotSecondView extends StatelessWidget {
  const ForgotSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
