import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/my_pay_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view_mobile.dart';
import 'package:ClockSpotter/views/My%20Pay/my_pay_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class MyPayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<MyPayViewModel>(
      viewModel: MyPayViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => MyPayMobilePortrait(),
          landscape: (context) => MyPayMobilePortrait(),
        ),
        tablet: MyPayMobilePortrait(), desktop: MyPayMobilePortrait(),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
