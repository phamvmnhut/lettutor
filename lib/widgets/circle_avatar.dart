import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  CircleAvatarWidget({Key? key, required this.imageUrl, required this.size});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        height: size,
        width: size,
        placeholder: 'assets/images/indicator.gif',
        image: imageUrl,
        imageErrorBuilder: (context, _, strace) =>
            Image.asset("assets/images/indicator.gif", fit: BoxFit.cover),
      ),
    );
  }
}
