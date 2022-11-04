import 'package:flutter/material.dart';

import '../viewmodels/home_viewmodel.dart';
import 'base_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeViewModel _model;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(onModelReady: (model) {
      _model = model;
    }, builder: (context, model, _) {
      return const Scaffold();
    });
  }
}
