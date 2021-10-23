import 'dart:ui';

extension ColorShades on Color {
  Color darker({int darkness = 10}) {
    int r = (red - darkness).clamp(0, 255);
    int g = (green - darkness).clamp(0, 255);
    int b = (blue - darkness).clamp(0, 255);
    return Color.fromRGBO(r, g, b, 1);
  }
  Color lighter({int lightness = 10}) {
    int r = (red + lightness).clamp(0, 255);
    int g = (green + lightness).clamp(0, 255);
    int b = (blue + lightness).clamp(0, 255);
    return Color.fromRGBO(r, g, b, 1);
  }
}
