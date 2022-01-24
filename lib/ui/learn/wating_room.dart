import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/booking.dart';

import 'package:lettutor/ui/components/background.dart';
import 'package:lettutor/ui/learn/video_learning.dart';

class WaitingRoomUI extends StatefulWidget {
  WaitingRoomUI({Key? key, required this.booking});

  final BookingModel booking;

  @override
  _WaitingRoomUIState createState() => _WaitingRoomUIState();
}

class _WaitingRoomUIState extends State<WaitingRoomUI>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inHours}h:${duration.inMinutes - duration.inHours * 60}m:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
        widget.booking.scheduleDetailInfo!.startPeriodTimestamp!);
    var dif = startTime.difference(DateTime.now());
    if (dif.inSeconds < 0) dif = Duration(seconds: 1);
    controller = AnimationController(vsync: this, duration: dif);
    controller
        .reverse(from: controller.value == 0.0 ? 1.0 : controller.value)
        .whenComplete(() {
      // put here the stuff you wanna do when animation completed!
      Get.off(() => VideoLearningUI(booking: widget.booking));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    Color indiColor = Theme.of(context).indicatorColor;
    return Material(
      child: SafeArea(
        child: Background(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                    painter: CustomTimerPainter(
                                  animation: controller,
                                  backgroundColor: indiColor,
                                  color: cardColor,
                                )),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Join lesson with",
                                        style: textTheme.headline2),
                                    Text(
                                      timerString,
                                      style: TextStyle(
                                        color: priColor,
                                        fontSize: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
