import 'package:ClockSpotter/viewmodels/request_letter_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/task_sheet_viewmodel.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view_mobile.dart';
import 'package:ClockSpotter/views/Task%20Sheet/task_sheet_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class TaskSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<TaskSheetViewModel>(
      viewModel: TaskSheetViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => TaskSheetMobilePortrait(),
          landscape: (context) => TaskSheetMobilePortrait(),
        ),
        tablet: TaskSheetMobilePortrait(), desktop: TaskSheetMobilePortrait(),
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
