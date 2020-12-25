import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class MusicProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  String songName = "Let's play something!";
  bool adjustingVolume = false;

  void resume() {
    if (player.duration != null) {
      player.play();
      notifyListeners();
    }
  }

  void pause() {
    player.pause();
    notifyListeners();
  }

  void play(SongInfo songInfo) {
    player.load(AudioSource.uri(Uri.file(songInfo.filePath)));
    player.play();
    songName = songInfo.displayName;
    notifyListeners();
  }

  void adjustVolume(double adjustedVolume) {
    player.setVolume(adjustedVolume);
    notifyListeners();
  }

  void settingVolume() {
    adjustingVolume = !adjustingVolume;
    notifyListeners();
  }
}
