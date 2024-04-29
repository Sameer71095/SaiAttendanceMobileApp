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
  })  : assert(child != null),
        assert(onModelReady != null),
        assert(viewModel != null),
        super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T _model;
  bool _isMounted = false;
  bool _isError = false;
  String _errorMessage = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;
    _isMounted = true;
    _isLoading = true;
    runModelReady();
  }

  void runModelReady() async {
    try {
      await widget.onModelReady(_model);
      if (_isMounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (_isMounted) {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage = e.toString();
        });
      }
      print('Error in onModelReady: $e');
      // TODO: Report the error to your error reporting service in a non-blocking way.
    }
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_isError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'An error occurred: $_errorMessage',
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: runModelReady,
              child: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Text color
                backgroundColor: Colors.blue, // Background color
              //  onSurface: Colors.grey,       // Disabled button color (optional)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) => _model,
        child: widget.child,
      );
    }
  }
}
