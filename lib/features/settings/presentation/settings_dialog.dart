import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/core/audio/audio_provider.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioSettings = ref.watch(audioProvider);

    return AlertDialog(
      title: const Text('Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mute All'),
              Switch(
                value: audioSettings.isMuted,
                onChanged: (val) {
                  ref.read(audioProvider.notifier).setMuted(val);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Music Volume'),
          Slider(
            value: audioSettings.bgmVolume,
            min: 0.0,
            max: 1.0,
            onChanged: audioSettings.isMuted
                ? null
                : (val) {
                    ref.read(audioProvider.notifier).setBgmVolume(val);
                  },
          ),
          const SizedBox(height: 16),
          const Text('SFX Volume'),
          Slider(
            value: audioSettings.sfxVolume,
            min: 0.0,
            max: 1.0,
            onChanged: audioSettings.isMuted
                ? null
                : (val) {
                    ref.read(audioProvider.notifier).setSfxVolume(val);
                  },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Optional: Play a test sound to preview SFX volume
            AudioManager.instance.playSfx('audio/sfx_click.mp3');
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
