import 'package:flutter/material.dart';
import 'package:video_streaming_app/Screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Video Streaming App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey0 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button to reload',
            ),
            // CommonPlayer(url: 'rtsp://guardnet.selfip.com:7100',key: _scaffoldKey0,),
            // CommonPlayer(url: 'http://pendelcam.kip.uni-heidelberg.de/mjpg/video.mjpg',key: _scaffoldKey1,),
            // CommonPlayer(url: 'http://assets.appcelerator.com.s3.amazonaws.com/video/media.m4v',key: _scaffoldKey2,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _scaffoldKey0.currentState?.initState();
            _scaffoldKey1.currentState?.initState();
            _scaffoldKey2.currentState?.initState();
          });
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
