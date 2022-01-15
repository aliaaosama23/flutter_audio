import 'dart:ui';

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
    if (_position == const Duration(seconds: 0)) {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.inSeconds.toStringAsFixed(2),
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  _duration.inSeconds.toStringAsFixed(2),
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbColor: Color(0xFFBF96E3),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
            ),
            child: Slider(
              activeColor: const Color(0xFF9472B1),
              inactiveColor: const Color(0xFF34293A),
              //  thumbColor: const Color(0xFFBF96E3),
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  value = value;
                  changeToSeconds(value.toInt());
                });
              },
            ),
          ),
          // IconButton(
          //   iconSize: 60,
          //   onPressed: () {
          //     setState(() {
          //       playerState == PlayerState.PLAYING ? pauseSound() : playSound();
          //     });
          //   },
          //   icon: Icon(
          //     playerState == PlayerState.PLAYING
          //         ? Icons.pause_rounded
          //         : Icons.play_arrow_rounded,
          //     color: const Color(0xFFFFFFFF),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                playerState == PlayerState.PLAYING ? pauseSound() : playSound();
              });
            },
            elevation: 2.0,
            fillColor: const Color(0xFF9472B1),
            constraints: const BoxConstraints(
              maxHeight: 100,
              maxWidth: 100,
            ),
            child: Icon(
              playerState == PlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: const Color(0xFFFFFFFF),
              size: 40,
            ),
            padding: const EdgeInsets.all(20.0),
            shape: const CircleBorder(),
          )
        ],
      ),
    );
  }
}
