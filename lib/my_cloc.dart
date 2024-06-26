import 'package:flutter/material.dart';
import 'dart:async';

import 'cloc_pointer.dart';

class MyClock extends StatefulWidget {
  const MyClock({super.key});

  @override
  _MyClockState createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: ClockPainter(
        dateTime: _dateTime,
      ),
    );
  }
}
