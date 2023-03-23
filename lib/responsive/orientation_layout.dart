import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget Function(BuildContext) landscape;
  final Widget Function(BuildContext) portrait;
  const OrientationLayout({
    Key? key,
    required this.landscape,
    required this.portrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var orientation = MediaQuery.of(context).orientation;
        if (orientation == Orientation.landscape) {
          return landscape(context);
        }

        return portrait(context);
      },
    );
  }
}
