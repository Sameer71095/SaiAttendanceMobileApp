import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/splash_viewmodel.dart';
import 'package:ClockSpotter/views/splash/splash_view_mobile.dart';
import 'package:ClockSpotter/views/splash/splash_view_tablet.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => SplashMobilePortrait(),
          landscape: (context) => SplashMobilePortrait(),
        ),
        tablet: SplashMobilePortrait(), desktop: SplashMobilePortrait(),
      ),
    );
  }
}

class SplashSecondView extends StatelessWidget {
  const SplashSecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
