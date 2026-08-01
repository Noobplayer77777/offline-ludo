import 'package:audioplayers/audioplayers.dart';
import 'package:offline_ludo/core/audio/audio_settings.dart';
import 'package:logger/logger.dart';

class AudioManager {
  final Logger _logger = Logger();
  
  // Singleton instance
  static final AudioManager _instance = AudioManager._internal();
  static AudioManager get instance => _instance;
  
  AudioManager._internal() {
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
  }

  final AudioPlayer _bgmPlayer = AudioPlayer();
  final List<AudioPlayer> _sfxPool = [];
  final int _poolSize = 5;

  AudioSettings _currentSettings = const AudioSettings();
  bool _initializedPool = false;

  void updateSettings(AudioSettings settings) {
    _currentSettings = settings;
    
    // Apply BGM volume
    if (settings.isMuted) {
      _bgmPlayer.setVolume(0);
    } else {
      _bgmPlayer.setVolume(settings.bgmVolume);
    }
  }

  Future<void> _initPoolIfNeed() async {
    if (_initializedPool) return;
    for (int i = 0; i < _poolSize; i++) {
      _sfxPool.add(AudioPlayer());
    }
    _initializedPool = true;
  }

  Future<void> playBgm(String assetPath) async {
    try {
      if (_currentSettings.isMuted) {
        await _bgmPlayer.setVolume(0);
      } else {
        await _bgmPlayer.setVolume(_currentSettings.bgmVolume);
      }
      await _bgmPlayer.play(AssetSource(assetPath));
    } catch (e) {
      _logger.w('Failed to play BGM: $assetPath. $e');
    }
  }

  Future<void> stopBgm() async {
    try {
      await _bgmPlayer.stop();
    } catch (e) {
      _logger.w('Failed to stop BGM. $e');
    }
  }

  Future<void> playSfx(String assetPath) async {
    if (_currentSettings.isMuted || _currentSettings.sfxVolume <= 0) return;

    try {
      await _initPoolIfNeed();
      
      // Find an available player
      AudioPlayer? playerToUse;
      for (var player in _sfxPool) {
        if (player.state != PlayerState.playing) {
          playerToUse = player;
          break;
        }
      }
      
      // If all are busy, just use the first one (interrupting it)
      playerToUse ??= _sfxPool.first;
      
      await playerToUse.setVolume(_currentSettings.sfxVolume);
      await playerToUse.play(AssetSource(assetPath));
    } catch (e) {
      _logger.w('Failed to play SFX: $assetPath. $e');
    }
  }

  void dispose() {
    _bgmPlayer.dispose();
    for (var player in _sfxPool) {
      player.dispose();
    }
  }
}
