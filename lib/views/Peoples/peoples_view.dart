import 'package:ClockSpotter/viewmodels/my_profile_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/peoples_viewmodel.dart';
import 'package:ClockSpotter/views/My%20Profile/my_profile_view_mobile.dart';
import 'package:ClockSpotter/views/Peoples/peoples_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/responsive/orientation_layout.dart';
import 'package:ClockSpotter/responsive/screen_type_layout.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/base_widget.dart';


class PeoplesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<PeoplesViewModel>(
      viewModel: PeoplesViewModel(),
      onModelReady: (model) => model.initialise(context),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => PeoplesMobilePortrait(),
          landscape: (context) =>PeoplesMobilePortrait(),
        ),
        tablet:PeoplesMobilePortrait(), desktop: PeoplesMobilePortrait(),
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
