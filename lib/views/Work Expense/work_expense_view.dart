
import 'package:ClockSpotter/viewmodels/work_expense_viewmodel.dart';

import 'package:ClockSpotter/views/Work%20Expense/work_expense_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class WorkExpenseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<WorkExpenseViewModel>(
      viewModel: WorkExpenseViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) =>   WorkExpenseMobilePortrait(),
          landscape: (context) =>    WorkExpenseMobilePortrait(),
        ),
        tablet:   WorkExpenseMobilePortrait(), desktop:  WorkExpenseMobilePortrait(),
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
