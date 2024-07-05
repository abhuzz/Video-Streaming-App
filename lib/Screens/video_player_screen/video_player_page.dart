import 'package:flutter/material.dart';
import 'package:video_streaming_app/Screens/video_player_screen/video_player_screen.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;
  const VideoPlayerPage({super.key,required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: VideoPlayerScreen(videoUrl: videoUrl),
    );
  }
}
