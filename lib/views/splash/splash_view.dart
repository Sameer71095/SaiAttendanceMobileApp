import 'package:flutter/material.dart';
import 'package:sai_attendance/responsive/orientation_layout.dart';
import 'package:sai_attendance/responsive/screen_type_layout.dart';
import 'package:sai_attendance/viewmodels/splash_viewmodel.dart';
import 'package:sai_attendance/views/splash/splash_view_mobile.dart';
import 'package:sai_attendance/views/splash/splash_view_tablet.dart';
import 'package:sai_attendance/widgets/base_widget.dart';


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
