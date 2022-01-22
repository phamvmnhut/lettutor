import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:lettutor/models/tutor_detail.dart';

class IntroTutorVideo extends StatefulWidget {
  IntroTutorVideo({Key? key, required this.data}) : super(key: key);
  final TutorDetailModel data;

  @override
  _IntroTutorVideoState createState() => _IntroTutorVideoState();
}

class _IntroTutorVideoState extends State<IntroTutorVideo> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.data.video);
    videoPlayerController.initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    return Center(
      child: Container(
        height: 200,
        width: double.infinity,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
