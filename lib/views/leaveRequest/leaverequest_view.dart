import 'package:ClockSpotter/viewmodels/leaverequest_viewmodel.dart';
import 'package:ClockSpotter/views/leaveRequest/leaverequest_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class LeaveRequestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<LeaveRequestViewModel>(
      viewModel: LeaveRequestViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LeaveRequestMobilePortrait(),
          landscape: (context) => LeaveRequestMobilePortrait(),
        ),
        tablet: LeaveRequestMobilePortrait(), desktop: LeaveRequestMobilePortrait(),
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
