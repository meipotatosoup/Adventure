// Start menu overlay - restored from previous MainMenu UI
import 'package:flutter/material.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class StartMenu extends StatefulWidget {
  final PixelAdventure game;

  const StartMenu({super.key, required this.game});

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.black.withOpacity(0.75),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 24.0),
          constraints: const BoxConstraints(maxWidth: 360),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2637),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: whiteTextColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ember Quest',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to Ember Quest!\nStart your adventure by pressing Play.',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteTextColor, fontSize: 16),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    widget.game.overlays.remove('StartMenu');
                    try {
                      widget.game.resumeEngine();
                    } catch (_) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                    foregroundColor: blackTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Controls:\n- WASD / Arrow Keys to move\n- Space to jump\nCollect stars and avoid enemies',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteTextColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
