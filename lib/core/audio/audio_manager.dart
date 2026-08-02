import 'dart:async';
import 'package:offline_ludo/core/audio/audio_settings.dart';
import 'package:logger/logger.dart';

class AudioManager {
  static final AudioManager instance = AudioManager._internal();

  AudioManager._internal();

  AudioSettings _settings = const AudioSettings();
  final Logger _logger = Logger();
  
  void updateSettings(AudioSettings settings) {
    _settings = settings;
    _logger.i('AudioSettings updated: BGM ${_settings.bgmVolume}, SFX ${_settings.sfxVolume}, Muted ${_settings.isMuted}');
  }

  Future<void> playBgm(String assetPath) async {
    // Stub
  }

  Future<void> stopBgm() async {
    // Stub
  }

  Future<void> playSfx(String assetPath) async {
    // Stub
  }

  void dispose() {
    // Stub
  }
}
