import 'package:flutter/material.dart';
import 'package:video_streaming_app/Screens/home/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Video Streaming'),
      ),
      body: const HomeScreen(),
    );
  }
}
