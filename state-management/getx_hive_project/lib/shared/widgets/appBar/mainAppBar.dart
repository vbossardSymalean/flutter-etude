import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainAppBar extends AppBar {
  MainAppBar({this.title, this.actions}) : super(actions: [], title: title);

  final Text title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: super.title,
      actions: this.actions,
    );
  }
}
