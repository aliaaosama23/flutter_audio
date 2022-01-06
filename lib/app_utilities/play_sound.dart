import 'package:audioplayers/audioplayers.dart';

class PlaySound {
  PlayerState playerState = PlayerState.STOPPED;
  playSound(int? cardNumber) {
    final player = AudioCache();
    player.play(
      'note$cardNumber.mp3',
    );
    player.clearAll();
  }

  play(int? cardNumber) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(
      'note$cardNumber.mp3',
      isLocal: true,
    );
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
    });

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      print('Current player state: $s');
      playerState = s;
    });
  }
}
