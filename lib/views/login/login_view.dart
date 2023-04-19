import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/login_viewmodel.dart';
import 'package:ClockSpotter/views/login/login_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobilePortrait(),
        ),
        tablet: LoginMobilePortrait(), desktop: LoginMobilePortrait(),
      ),
    );
  }
}

class LoginSecondView extends StatelessWidget {
  const LoginSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
