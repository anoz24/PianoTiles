import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano',
      debugShowCheckedModeBanner: false,
      home: PianoTiles(),
    );
  }
}

class PianoTiles extends StatelessWidget {
  final player = AssetsAudioPlayer();

  void playNote(String note) {
    player.open(
      Audio("assets/notes/$note.mp3"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double whiteWidth = constraints.maxWidth / 7;
            return Stack(
              fit: StackFit.expand,
              children: [
                whiteTile('C', 0, whiteWidth),
                whiteTile('D', 1, whiteWidth),
                whiteTile('E', 2, whiteWidth),
                whiteTile('F', 3, whiteWidth),
                whiteTile('G', 4, whiteWidth),
                whiteTile('A', 5, whiteWidth),
                whiteTile('B', 6, whiteWidth),
                blackTile('Db', 1, whiteWidth, constraints.maxHeight / 2),
                blackTile('Eb', 2, whiteWidth, constraints.maxHeight / 2),
                blackTile('Gb', 4, whiteWidth, constraints.maxHeight / 2),
                blackTile('Ab', 5, whiteWidth, constraints.maxHeight / 2),
                blackTile('Bb', 6, whiteWidth, constraints.maxHeight / 2),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget whiteTile(String note, double position, double whiteWidth) {
    return Positioned(
      top: 0,
      left: position * whiteWidth,
      width: whiteWidth,
      bottom: 0,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        onPressed: () => playNote('$note'),
      ),
    );
  }

  Widget blackTile(
      String note, double position, double whiteWidth, double height) {
    double blackWidth = whiteWidth * 0.60;
    return Positioned(
      top: 0,
      left: position * whiteWidth - blackWidth / 2,
      width: blackWidth,
      height: height,
      child: RawMaterialButton(
        fillColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        onPressed: () => playNote('$note'),
      ),
    );
  }
}
