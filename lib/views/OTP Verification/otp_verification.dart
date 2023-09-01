import 'package:ClockSpotter/viewmodels/forgot_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/otp_viewmodel.dart';
import 'package:ClockSpotter/views/OTP%20Verification/otp_verification_mobile.dart';
import 'package:ClockSpotter/views/forgot%20password/forgot_password_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class OTPView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<OTPViewModel>(
      viewModel: OTPViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => OTPMobilePortrait(),
          landscape: (context) => OTPMobilePortrait(),
        ),
        tablet: OTPMobilePortrait(), desktop:  OTPMobilePortrait(),
      ),
    );
  }
}

class OTPSecondView extends StatelessWidget {
  const OTPSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
