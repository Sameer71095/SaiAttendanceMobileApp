import 'package:ClockSpotter/viewmodels/request_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/time_sheet_viewmodel.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view_mobile.dart';
import 'package:ClockSpotter/views/Time%20Sheet/time_sheet_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class TimeSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<TimeSheetViewModel>(
      viewModel: TimeSheetViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => TimeSheetMobilePortrait(),
          landscape: (context) => TimeSheetMobilePortrait(),
        ),
        tablet: TimeSheetMobilePortrait(), desktop: TimeSheetMobilePortrait(),
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
