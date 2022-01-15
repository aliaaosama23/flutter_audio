import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicalCard extends StatefulWidget {
  const MusicalCard({
    Key? key,
    required this.cardColor,
    required this.cardNumber,
  }) : super(key: key);

  final Color cardColor;
  final int cardNumber;
  static const IconData cardIconNotPressed = Icons.play_arrow;
  static const IconData cardIconPressed = Icons.stop;

  @override
  State<MusicalCard> createState() => _MusicalCardState();
}

class _MusicalCardState extends State<MusicalCard> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  PlayerState playerState = PlayerState.PAUSED;
  Duration _duration = const Duration();
  Duration _position = const Duration(seconds: 0);
  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        playerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playSound() async {
    if (_position == Duration(seconds: 0)) {
      await audioCache.play('note${widget.cardNumber}.mp3');
    } else {
      await audioPlayer.resume();
    }
  }

  pauseSound() async {
    await audioPlayer.pause();
  }

  changeToSeconds(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF493A58), //Color(0xFFFFD39A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'سورة النازعات جزء ${widget.cardNumber}',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                playerState == PlayerState.PLAYING ? pauseSound() : playSound();
              });
            },
            icon: Icon(
              playerState == PlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              size: 40,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.black,
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  value = value;
                  print('new potion on change is $value');
                  changeToSeconds(value.toInt());
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.inSeconds.toStringAsFixed(2)),
                Text(_duration.inSeconds.toStringAsFixed(2))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
