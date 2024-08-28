import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:one_clock/one_clock.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';

class AnalogClockInforvix extends StatefulWidget {
  @override
  _AnalogClockInforvixState createState() => _AnalogClockInforvixState();
}

class _AnalogClockInforvixState extends State<AnalogClockInforvix> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CurrentTime(),
          Container(
            constraints: BoxConstraints.expand(),
            child: CustomPaint(
              painter: ClockPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  late Stream<String> _timeStream;

  @override
  void initState() {
    super.initState();
    _timeStream = _getTimeStream();
  }

  Stream<String> _getTimeStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateFormat('HH:mm:ss').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _timeStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          return Text(
            snapshot.data ?? '',
            style: Fonts.textStyleBotao.copyWith(fontSize: 26),
          );
        }
      },
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 1;

    double radius = min(centerY, centerX);

    Paint dashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Paint secdashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double outerRadius = radius;
    double outerRadiusDash = radius - 15;
    double innerRadiusDash = radius - 36;
    double outerRadiusSec = radius - 20;
    double innerRadiusSec = radius - 20;

    for (int i = 0; i < 60; i++) {
      if (i % 5 == 0) {
        double x1 = centerX - outerRadiusDash * cos(i * 6 * pi / 180);
        double y1 = centerX - outerRadiusDash * sin(i * 6 * pi / 180);
        double x2 = centerX - innerRadiusDash * cos(i * 6 * pi / 180);
        double y2 = centerX - innerRadiusDash * sin(i * 6 * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashPaint);
      } else {
        double x1 = centerX - outerRadiusSec * 0.95 * cos(i * 6 * pi / 180);
        double y1 = centerX - outerRadiusSec * 0.95 * sin(i * 6 * pi / 180);
        double x2 = centerX - innerRadiusSec * cos(i * 6 * pi / 180);
        double y2 = centerX - innerRadiusSec * sin(i * 6 * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), secdashPaint);
      }
    }

    DateTime dateTime = DateTime.now();

    Offset secondStartOffset = Offset(
        centerX - outerRadius * .6 * cos(dateTime.second * 6 * pi / 180),
        centerX - outerRadius * .6 * sin(dateTime.second * 6 * pi / 180));
    Offset secondEndOffset = Offset(
        centerX + cos(dateTime.second * 6 * pi / 180),
        centerX + sin(dateTime.second * 6 * pi / 180));

    Offset minStartOffset = Offset(
        centerX - outerRadius * .6 * cos(dateTime.minute * 6 * pi / 180),
        centerX - outerRadius * .6 * sin(dateTime.minute * 6 * pi / 180));
    Offset minEndOffset = Offset(
        centerX + 15 * cos(dateTime.minute * 6 * pi / 180),
        centerX + 15 * sin(dateTime.minute * 6 * pi / 180));

    Offset hourStartOffset = Offset(
        centerX -
            outerRadius *
                .4 *
                cos((dateTime.hour % 12 + dateTime.minute / 60) *
                    5 *
                    6 *
                    pi /
                    180),
        centerX -
            outerRadius *
                .4 *
                sin((dateTime.hour % 12 + dateTime.minute / 60) *
                    5 *
                    6 *
                    pi /
                    180));
    Offset hourEndOffset = Offset(centerX + cos(dateTime.hour * 6 * pi / 180),
        centerX + sin(dateTime.hour * 6 * pi / 180));

    //canvas.drawLine(secondStartOffset, secondEndOffset, secondPaint);
    //canvas.drawLine(minStartOffset, minEndOffset, minPaint);
    //canvas.drawLine(hourStartOffset, hourEndOffset, hourPaint);
    //canvas.drawCircle(center, 10, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
