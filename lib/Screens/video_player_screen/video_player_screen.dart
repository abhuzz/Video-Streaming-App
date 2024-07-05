import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_streaming_app/Screens/home/home_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({super.key,required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late VlcPlayerController _vlcController;
  String errorMessage = '';
  Key _refreshKey = UniqueKey();
  late bool _isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() async {

    _vlcController = VlcPlayerController.network(
      widget.videoUrl,
      autoPlay: true,
      hwAcc: HwAcc.full,
      options: VlcPlayerOptions(
          advanced: VlcAdvancedOptions([
            VlcAdvancedOptions.networkCaching(300),
          ]),
          http: VlcHttpOptions([
            VlcHttpOptions.httpReconnect(true),
          ]),
          extras: [
            ':high-priority', ':rtsp-mcast', ':rtsp-tcp', ':avcodec-hw=any',
          ]),
    );
    _vlcController.addListener(() => checkErrorPlayer());
  }

  checkErrorPlayer() {
    if (_vlcController.value.hasError) {
      setState(() {
        errorMessage = _vlcController.value.errorDescription;
      });
    }

  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  Future<bool> onWillPop() async {
    _vlcController.removeListener(checkErrorPlayer);
    await _vlcController.stopRendererScanning();
    await _vlcController.dispose();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool val) async {
        _vlcController.removeListener(checkErrorPlayer);
        await _vlcController.stopRendererScanning();
        await _vlcController.dispose();

      },
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VlcPlayer(
                controller: _vlcController,
                aspectRatio: 16 / 9,
                placeholder: const Center(child: CircularProgressIndicator()),
                key: _refreshKey,
              ),
              const SizedBox(
                height: 4,
              ),
              Visibility(
                visible: errorMessage.isNotEmpty,
                child: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Error:$errorMessage",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.5),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _isPlaying
                      ? TextButton(
                    onPressed: () {
                      setState(() {
                        _isPlaying = false;
                        _vlcController.pause();
                      });
                    },
                    child: const Icon(
                      Icons.pause,
                      size: 30,
                    ),
                  )
                      : TextButton(
                    onPressed: () {
                      setState(() {
                        _isPlaying = true;
                        _vlcController.play();
                      });
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      size: 30,
                    ),
                  ),
                ]),
              )
            ],
          )
      ),
    );
  }


}
