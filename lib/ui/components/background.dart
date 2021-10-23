import 'package:flutter/material.dart';
import 'package:lettutor/utils/ex.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color shapeColor = Theme.of(context).primaryColor;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              height: size.height * 0.15,
              width: size.width * 0.4,
              child: CustomPaint(
                size: Size.infinite, //2
                painter: _ShapeTopLeft(color: shapeColor), //3
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.15,
              width: size.width * 0.9,
              child: CustomPaint(
                size: Size.infinite, //2
                painter: _ShapeBottomRight(color: shapeColor), //3
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  static Widget another1({ required Widget child}) => _BgAnother1(child: child);
  static Widget another2({ required Widget child}) => _BgAnother2(child: child);
}

class _BgAnother1 extends StatelessWidget {
  final Widget child;

  const _BgAnother1({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color shapeColor = Theme.of(context).primaryColor;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.7,
              child: CustomPaint(
                size: Size.infinite, //2
                painter: _ShapeTopLeft(color: shapeColor), //3
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.85,
              child: CustomPaint(
                size: Size.infinite, //2
                painter: _ShapeBottomRight(color: shapeColor), //3
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

}


class _BgAnother2 extends StatelessWidget {
  final Widget child;

  const _BgAnother2({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color shapeColor = Theme.of(context).primaryColor;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.85,
              child: CustomPaint(
                size: Size.infinite, //2
                painter: _ShapeBottomRight(color: shapeColor), //3
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

}



class _ShapeTopLeft extends CustomPainter {
  _ShapeTopLeft({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
    final curvedShapeBounds = Rect.fromLTRB(
      shapeBounds.left,
      shapeBounds.top,
      shapeBounds.right,
      shapeBounds.bottom,
    );

    _drawCurvedShape(canvas, curvedShapeBounds);
  }

  void _drawCurvedShape(Canvas canvas, Rect bounds) {
    final colors = [color.darker(), color, color.darker()];
    final stops = [0.0, 0.3, 1.0];
    final gradient = LinearGradient(colors: colors, stops: stops);
    final paint = Paint()..shader = gradient.createShader(bounds);
    final handlePoint = Offset(bounds.right, bounds.bottom);

    final curvePath = Path()
      ..moveTo(bounds.left, bounds.top)
      ..lineTo(bounds.topRight.dx, bounds.topRight.dy)
      ..quadraticBezierTo(handlePoint.dx, handlePoint.dy, bounds.bottomLeft.dx,
          bounds.bottomLeft.dy)
      ..close(); //9

    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(_ShapeTopLeft oldDelegate) {
    return color != oldDelegate.color;
  }
}

class _ShapeTopRight extends CustomPainter {
  _ShapeTopRight({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
    final curvedShapeBounds = Rect.fromLTRB(
      shapeBounds.left,
      shapeBounds.top,
      shapeBounds.right,
      shapeBounds.bottom,
    );

    _drawCurvedShape(canvas, curvedShapeBounds);
  }

  void _drawCurvedShape(Canvas canvas, Rect bounds) {
    final colors = [color.darker(), color, color.darker()];
    final stops = [0.0, 0.3, 1.0];
    final gradient = LinearGradient(colors: colors, stops: stops);
    final paint = Paint()..shader = gradient.createShader(bounds);
    final handlePoint = Offset(bounds.right, bounds.bottom);

    final curvePath = Path()
      ..moveTo(bounds.left, bounds.top)
      ..quadraticBezierTo(handlePoint.dx, handlePoint.dy, bounds.bottomLeft.dx,
          bounds.bottomLeft.dy)
      ..lineTo(bounds.topRight.dx, bounds.topRight.dy)
      ..close(); //9

    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(_ShapeTopLeft oldDelegate) {
    return color != oldDelegate.color;
  }
}

class _ShapeBottomRight extends CustomPainter {
  _ShapeBottomRight({required this.color});

  final Color color;
  final double avatarRadius = 40;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
    final curvedShapeBounds = Rect.fromLTRB(
      shapeBounds.left,
      shapeBounds.top,
      shapeBounds.right,
      shapeBounds.bottom,
    );

    _drawCurvedShape(canvas, curvedShapeBounds);
  }

  void _drawCurvedShape(Canvas canvas, Rect bounds) {
    final colors = [color.darker(), color, color.darker()];
    final stops = [0.0, 0.3, 1.0];
    final gradient = LinearGradient(colors: colors, stops: stops);
    final paint = Paint()..shader = gradient.createShader(bounds);
    final handlePoint = Offset(bounds.left + (bounds.width * 0.25), bounds.top);

    final curvePath = Path()
      ..moveTo(bounds.bottomLeft.dx, bounds.bottomLeft.dy)
      ..lineTo(bounds.bottomRight.dx, bounds.bottomRight.dy)
      ..lineTo(bounds.topRight.dx, bounds.topRight.dy)
      ..quadraticBezierTo(handlePoint.dx, handlePoint.dy, bounds.bottomLeft.dx,
          bounds.bottomLeft.dy)
      ..close();

    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(_ShapeBottomRight oldDelegate) {
    return color != oldDelegate.color;
  }
}
