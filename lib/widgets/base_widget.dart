import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Function(T) onModelReady;
  final T viewModel;
  BaseWidget({
    Key? key,
    required this.child,
    required this.onModelReady,
    required this.viewModel,
  }) : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;

    widget.onModelReady(_model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: widget.child,
    );
  }
}
