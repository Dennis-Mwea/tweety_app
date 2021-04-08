import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function? onInit;
  final Widget child;

  const StatefulWrapper({Key? key, this.onInit, required this.child}) : super(key: key);

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) widget.onInit!();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
