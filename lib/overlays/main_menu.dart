// MAIN_MENU_OVERLAY_REWRITTEN
import 'package:flutter/material.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class MainMenu extends StatefulWidget {
  // Reference to parent game.
  final PixelAdventure game;

  const MainMenu({super.key, required this.game});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    // Pause the game while the main menu is visible.
    try {
      widget.game.pauseEngine();
    } catch (_) {}
  }

  @override
  void dispose() {
    // Ensure the game is resumed if the menu is removed.
    try {
      widget.game.resumeEngine();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.black54,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900, maxHeight: 640),
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: blackTextColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: whiteTextColor, width: 3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header: Levels / SideQuests
                Row(
                  children: const [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Levels',
                          style: TextStyle(
                            color: whiteTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'SideQuests',
                        style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Main content frame
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(18, 18, 18, 1.0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: whiteTextColor, width: 2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left: Avatar + Name
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 160,
                            height: 220,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: whiteTextColor,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Avatar',
                                style: TextStyle(color: blackTextColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(
                            width: 160,
                            child: Text(
                              'Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 18),

                      // Right: SideQuests list + Add button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // SideQuest lines
                            for (var i = 0; i < 3; i++) ...[
                              Container(
                                height: 46,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Sidequest ${i + 1}',
                                    style: const TextStyle(
                                      color: blackTextColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            const SizedBox(height: 6),

                            // Spacer then Add button aligned bottom-right
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: hook up add sidequest action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteTextColor,
                                  foregroundColor: blackTextColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text('Add SideQuest'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Footer actions (Close / Resume)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          widget.game.overlays.remove('MainMenu');
                          try {
                            widget.game.resumeEngine();
                          } catch (_) {}
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: whiteTextColor,
                            width: 2,
                          ),
                          foregroundColor: whiteTextColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Resume',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Example: go to main menu or start new game
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteTextColor,
                          foregroundColor: blackTextColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Play',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
