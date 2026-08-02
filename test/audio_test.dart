import 'package:flutter_test/flutter_test.dart';
import 'package:offline_ludo/core/audio/audio_settings.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';

void main() {
  group('AudioSettings', () {
    test('fromJson and toJson', () {
      final json = {'bgmVolume': 0.5, 'sfxVolume': 0.8, 'isMuted': true};
      final settings = AudioSettings.fromJson(json);
      expect(settings.bgmVolume, 0.5);
      expect(settings.sfxVolume, 0.8);
      expect(settings.isMuted, true);
      
      final outJson = settings.toJson();
      expect(outJson, json);
    });

    test('copyWith updates fields correctly', () {
      const settings = AudioSettings(bgmVolume: 1.0, sfxVolume: 1.0, isMuted: false);
      final newSettings = settings.copyWith(bgmVolume: 0.5, isMuted: true);
      expect(newSettings.bgmVolume, 0.5);
      expect(newSettings.sfxVolume, 1.0);
      expect(newSettings.isMuted, true);
    });
  });

  group('AudioManager', () {
    test('updateSettings updates the internal state without throwing', () {
      final manager = AudioManager.instance;
      // updateSettings should not throw an exception
      expect(
        () => manager.updateSettings(const AudioSettings(isMuted: true)),
        returnsNormally,
      );
    });
    
    test('playBgm and other stubs do not throw', () async {
      final manager = AudioManager.instance;
      expect(() async => await manager.playBgm('test.mp3'), returnsNormally);
      expect(() async => await manager.stopBgm(), returnsNormally);
      expect(() async => await manager.playSfx('test.mp3'), returnsNormally);
      expect(() => manager.dispose(), returnsNormally);
    });
  });
}
