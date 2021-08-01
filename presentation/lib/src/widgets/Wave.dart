import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presentation/src/utils/ClipperWidget.dart';

class Wave extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  Wave({required this.size, required this.yOffset, required this.color});

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
      ..addListener(() {
        wavePoints.clear();

        final double waveSpeed = animationController.value * 1080;
        final double fullSphere = animationController.value * pi * 2;
        final double normalizer = cos(fullSphere);
        final double waveWidth = pi / 270;
        final double waveHeight = 20.0;

        for (int i = 0; i <= widget.size.width.toInt(); ++i) {
          double calc = sin((waveSpeed - i) * waveWidth);
          wavePoints.add(Offset(i.toDouble(), calc * waveHeight * normalizer + widget.yOffset));
        }
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(waveList: wavePoints),
          child: Container(width: widget.size.width, height: widget.size.height, color: widget.color),
        );
      },
    );
  }
}
