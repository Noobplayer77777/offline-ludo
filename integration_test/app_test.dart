import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:offline_ludo/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on Start Local Game, verify navigate to game screen',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final createButton = find.text('Create Room (Host)');
      expect(createButton, findsOneWidget);

      await tester.tap(createButton);
      await tester.pumpAndSettle();

      expect(find.text('Game Lobby'), findsOneWidget);
      
      final startButton = find.text('Start Game');
      if (startButton.evaluate().isNotEmpty) {
        // Trace the navigation and GameScreen rendering for performance profiling
        await binding.traceAction(() async {
          await tester.tap(startButton);
          await tester.pumpAndSettle();
        }, reportKey: 'game_screen_transition_perf');
        
        expect(find.text('Roll Dice'), findsOneWidget);
      }
    });
  });
}
