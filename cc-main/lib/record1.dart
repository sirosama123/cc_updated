import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';



class rec extends StatelessWidget {
  const rec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140, left: 4, right: 4),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SocialMediaRecorder(
                      sendRequestFunction: (soundFile) {
                        print("the current path is ${soundFile.path}");
                           AssetsAudioPlayer.newPlayer().open(
    Audio(soundFile.path),
  
    showNotification: true,
);
                      },
                      encode: AudioEncoderType.AAC,
                    ),
                  ),
                ),
              ],
            ),
          ),
             
        ],
      ),
    );
  }
}