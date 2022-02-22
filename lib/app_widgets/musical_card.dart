import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/app_utilities/constants.dart';
import 'package:musical_app/translations/locale_keys.g.dart';

class MusicalCard extends StatefulWidget {
  const MusicalCard({
    Key? key,
    required this.cardNumber,
  }) : super(key: key);

  final int cardNumber;
  static const IconData cardIconNotPressed = Icons.play_arrow;
  static const IconData cardIconPressed = Icons.stop;

  @override
  State<MusicalCard> createState() => _MusicalCardState();
}

class _MusicalCardState extends State<MusicalCard>
    with SingleTickerProviderStateMixin {
  //2- animation controller
  late AnimationController controller;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  PlayerState playerState = PlayerState.PAUSED;
  Duration _duration = const Duration();
  Duration _position = const Duration(seconds: 0);
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this, //1- make this state as a ticker
      duration: const Duration(seconds: 1),
      lowerBound: 50,
      upperBound: 200,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
      //3- animation value
      print(controller.value);
    });
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

    audioPlayer.setUrl('note${widget.cardNumber}.mp3');

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
    if (_position == const Duration(seconds: 0) ||
        playerState == PlayerState.COMPLETED) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                '${LocaleKeys.SOURA_NAZAAT_JOSA.tr()}${widget.cardNumber}',
                textStyle: kQuranTitleStyle,
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.inSeconds.toStringAsFixed(2),
                  style: kTimeStyle,
                ),
                Text(
                  _duration.inSeconds.toStringAsFixed(2),
                  style: kTimeStyle,
                )
              ],
            ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbColor: kSliderThumbColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
            ),
            child: Slider(
              activeColor: kActiveColor,
              inactiveColor: kInActiveColor,
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
            fillColor: kActiveColor,
            constraints: const BoxConstraints(
              maxHeight: 100,
              maxWidth: 100,
            ),
            child: Icon(
              playerState == PlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: kWhiteColor,
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
