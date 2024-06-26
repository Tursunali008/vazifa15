import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 77, 16, 95)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = const Color.fromARGB(255, 233, 243, 250)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 105, paint3);
    canvas.drawCircle(center, 95, paint);
    canvas.drawCircle(center, 25, paint2);

    final paintHourHand = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    final paintMinuteHand = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final paintSecondHand = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    const hourHandLength = 50.0;
    const minuteHandLength = 70.0;
    const secondHandLength = 90.0;

    final hourHandX = center.dx +
        hourHandLength *
            cos((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180 -
                pi / 2);
    final hourHandY = center.dy +
        hourHandLength *
            sin((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180 -
                pi / 2);

    final minuteHandX = center.dx +
        minuteHandLength * cos(dateTime.minute * 6 * pi / 180 - pi / 2);
    final minuteHandY = center.dy +
        minuteHandLength * sin(dateTime.minute * 6 * pi / 180 - pi / 2);

    final secondHandX = center.dx +
        secondHandLength * cos(dateTime.second * 6 * pi / 180 - pi / 2);
    final secondHandY = center.dy +
        secondHandLength * sin(dateTime.second * 6 * pi / 180 - pi / 2);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), paintHourHand);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), paintMinuteHand);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), paintSecondHand);
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.dateTime != dateTime;
  }
}
