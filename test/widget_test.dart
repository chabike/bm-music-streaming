import 'package:flutter_test/flutter_test.dart';
import 'package:bm_music_streaming/presentation/splash/splash_screen.dart';
import 'package:bm_music_streaming/presentation/providers/theme_provider.dart';
import 'package:bm_music_streaming/presentation/providers/music_provider.dart';
import 'package:bm_music_streaming/presentation/providers/player_provider.dart';
import 'package:bm_music_streaming/services/audio_player_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Splash screen renders BM logo text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()..load()),
          ChangeNotifierProvider(create: (_) => MusicProvider()),
          ChangeNotifierProvider(create: (_) => PlayerProvider(BmAudioHandler())),
        ],
        child: const MaterialApp(home: SplashScreen()),
      ),
    );

    expect(find.text('BM'), findsOneWidget);
  });
}
