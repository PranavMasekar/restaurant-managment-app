import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/viewmodels/base_viewmodel.dart';
import '../locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final void Function(T)? onModelReady;
  final void Function(T)? onModelDestroy;

  const BaseView({
    required this.builder,
    Key? key,
    this.onModelReady,
    this.onModelDestroy,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    widget.onModelDestroy?.call(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
