import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/overlays/game_over.dart';
import 'package:pixel_adventure/overlays/main_menu.dart';
import 'package:pixel_adventure/overlays/start_menu.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  final game = PixelAdventure();

  runApp(
    RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.keyF) {
          if (game.overlays.isActive('MainMenu')) {
            game.overlays.remove('MainMenu');
            try {
              game.resumeEngine();
            } catch (_) {}
          } else {
            game.overlays.add('MainMenu');
            try {
              game.pauseEngine();
            } catch (_) {}
          }
        }
      },
      child: GameWidget(
        game: game,
        overlayBuilderMap: {
          'MainMenu': (_, g) => MainMenu(game: g as PixelAdventure),
          'StartMenu': (_, g) => StartMenu(game: g as PixelAdventure),
          'GameOver': (_, g) => GameOver(game: g as PixelAdventure),
        },
        initialActiveOverlays: const ['StartMenu'],
      ),
    ),
  );
}
