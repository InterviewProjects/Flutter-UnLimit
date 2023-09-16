import 'package:flutter/material.dart';

abstract class UnLimitScreenWidget extends StatelessWidget {

  const UnLimitScreenWidget({required super.key}) : super();

  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    var view = buildView(context);
    return view;
  }
}