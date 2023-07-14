import 'package:ClockSpotter/viewmodels/register_viewmodel.dart';
import 'package:ClockSpotter/views/Registeration/register_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/login_viewmodel.dart';
import 'package:ClockSpotter/views/login/login_view_mobile.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => RegisterMobilePortrait(),
          landscape: (context) => RegisterMobilePortrait(),
        ),
        tablet:RegisterMobilePortrait(), desktop: RegisterMobilePortrait(),
      ),
    );
  }
}

class RegisterSecondView extends StatelessWidget {
  const RegisterSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
