import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicOptionsScreen extends StatefulWidget {
  @override
  _MusicOptionsScreenState createState() => _MusicOptionsScreenState();
}

class _MusicOptionsScreenState extends State<MusicOptionsScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void toggleMusic() {
    if (isPlaying) {
      audioPlayer.stop();
    } else {
      audioPlayer.play(UrlSource('https://example.com/ocean_waves.mp3'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music & Sounds'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleMusic,
          child: Text(isPlaying ? 'Stop Music' : 'Play Music'),
        ),
      ),
    );
  }
}
