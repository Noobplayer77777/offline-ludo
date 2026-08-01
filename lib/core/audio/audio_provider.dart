import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:offline_ludo/core/audio/audio_settings.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';

const String _kVolumeBgm = 'audio_bgm_volume';
const String _kVolumeSfx = 'audio_sfx_volume';
const String _kMute = 'audio_mute';

final audioProvider = NotifierProvider<AudioNotifier, AudioSettings>(() {
  return AudioNotifier();
});

class AudioNotifier extends Notifier<AudioSettings> {
  @override
  AudioSettings build() {
    _loadSettings();
    return const AudioSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final bgmVol = prefs.getDouble(_kVolumeBgm) ?? 1.0;
    final sfxVol = prefs.getDouble(_kVolumeSfx) ?? 1.0;
    final isMuted = prefs.getBool(_kMute) ?? false;

    state = AudioSettings(
      bgmVolume: bgmVol,
      sfxVolume: sfxVol,
      isMuted: isMuted,
    );
    AudioManager.instance.updateSettings(state);
  }

  Future<void> setBgmVolume(double vol) async {
    state = state.copyWith(bgmVolume: vol);
    AudioManager.instance.updateSettings(state);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kVolumeBgm, vol);
  }

  Future<void> setSfxVolume(double vol) async {
    state = state.copyWith(sfxVolume: vol);
    AudioManager.instance.updateSettings(state);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kVolumeSfx, vol);
  }

  Future<void> setMuted(bool muted) async {
    state = state.copyWith(isMuted: muted);
    AudioManager.instance.updateSettings(state);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kMute, muted);
  }
}
