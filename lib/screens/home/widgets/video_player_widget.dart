import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? controller;

  bool isError = false;

  @override
  void initState() {
    super.initState();

    initializeVideo();
  }

  Future<void> initializeVideo() async {
    try {
      if (widget.videoUrl.isEmpty) {
        isError = true;

        setState(() {});

        return;
      }

      controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

      await controller!.initialize();

      controller!
        ..setLooping(true)
        ..play();

      setState(() {});
    } catch (e) {
      print("VIDEO ERROR => $e");

      isError = true;

      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return const Center(
        child: Text("Video Not Found", style: TextStyle(color: Colors.white)),
      );
    }

    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,

        child: SizedBox(
          width: controller!.value.size.width,

          height: controller!.value.size.height,

          child: VideoPlayer(controller!),
        ),
      ),
    );
  }
}
