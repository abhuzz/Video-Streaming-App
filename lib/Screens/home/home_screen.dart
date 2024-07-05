import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming_app/Core/database/db.dart';
import 'package:video_streaming_app/Core/util/utility_support.dart';
import 'package:video_streaming_app/Screens/video_player_screen/video_player_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _rtspTextController = TextEditingController(text: '');
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(
                    "RTSP URL: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: TextFormField(
                        controller: _rtspTextController,
                        keyboardType: TextInputType.url,
                        onChanged: (value) {
                          Db.rtspUrl = value;
                        },
                        validator: (val) {
                          return UtilitySupport.checkUrl(val);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  if(UtilitySupport.isValidUrl(_rtspTextController.text)){
                    navigatePlayer();
                  }
                },
                child: const Text(
                  'Start Stream',
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  navigatePlayer();
                },
                child: const Text(
                  'Default Stream',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  navigatePlayer(){
    Future.delayed(const Duration(milliseconds: 500), () async {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoPlayerPage(videoUrl: Db.rtspUrl)),
      );
    });
  }
  

}
