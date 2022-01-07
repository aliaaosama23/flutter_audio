import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MusicalCard extends StatefulWidget {
  MusicalCard({Key? key, required this.cardColor, required this.cardNumber})
      : super(key: key);

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
  final double _currentSliderValue = 0.0;
  Duration duration = const Duration();
  Duration position = const Duration();
  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        print('Max duration: ${d.inSeconds}');
        duration = d;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      position = p;
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      print('Current player state: $s');
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
    await audioCache.play('note${widget.cardNumber}.mp3');
    print('current state is $playerState');
  }

  pauseSound() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFD39A),
        body:
            //Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            // Text(
            //   'سورة النازعات جزء ${widget.cardNumber}',
            //   style: const TextStyle(
            //     fontSize: 25,
            //     color: Colors.white,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {
            //     print('press item ${widget.cardNumber} ');
            //     print('current state is $playerState');
            //     setState(() {
            //       playerState == PlayerState.PLAYING ? pauseSound() : playSound();
            //     });
            //   },
            //   icon: Icon(
            //     playerState == PlayerState.PLAYING
            //         ? Icons.pause_rounded
            //         : Icons.play_arrow_rounded,
            //     size: 40,
            //     color: const Color(0xFFFFFFFF),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Slider(
            //     activeColor: Colors.white,
            //     inactiveColor: Colors.black,
            //     value: position.inSeconds.toDouble(),
            //     max: position.inSeconds.toDouble(),
            //     label: _currentSliderValue.round().toString(),
            //     onChanged: (double value) {
            //       setState(() {
            //         print('slider value is $value');
            //         value = value;
            //       });
            //     },
            //     // onChangeStart: (double startVal) {
            //     //   print('slider start val is $startVal');
            //     // },
            //     // onChangeEnd: (double endVal) {
            //     //   print('slider end val is $endVal');
            //     // },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(position.inSeconds.toString()),
            //       Text(duration.inSeconds.toString())
            //     ],
            //   ),
            // ),
            SvgPicture.asset(
          'assets/012___Hafs39__DM.svg',
          semanticsLabel: 'Acme Logo',
        )
        //   ],
        // ),
        );
  }
}
