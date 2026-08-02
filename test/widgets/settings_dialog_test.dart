import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:offline_ludo/core/audio/audio_provider.dart';
import 'package:offline_ludo/features/settings/presentation/settings_dialog.dart';

void main() {
  testWidgets('SettingsDialog shows and updates settings', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SettingsDialog(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Mute All'), findsOneWidget);
    expect(find.text('Music Volume'), findsOneWidget);
    expect(find.text('SFX Volume'), findsOneWidget);

    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);
    
    // Tap the switch to mute
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();
    
    // Check if state is updated
    final element = tester.element(find.byType(SettingsDialog));
    final container = ProviderScope.containerOf(element);
    final audioSettings = container.read(audioProvider);
    expect(audioSettings.isMuted, true);

    // Let's unmute
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();
    expect(container.read(audioProvider).isMuted, false);

    // Find sliders
    final sliders = find.byType(Slider);
    expect(sliders, findsNWidgets(2));
    
    final bgmSlider = tester.widget<Slider>(sliders.first);
    expect(bgmSlider.value, 1.0);
    
    // Test close button
    final closeButton = find.text('Close');
    expect(closeButton, findsOneWidget);
    await tester.tap(closeButton);
    await tester.pumpAndSettle();
    
    expect(find.byType(SettingsDialog), findsNothing);
  });
}
