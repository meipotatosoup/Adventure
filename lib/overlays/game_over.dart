import 'package:flutter/material.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

// class GameOver extends StatefulWidget {
//   // Reference to parent game.
//   final PixelAdventure game;
//   const GameOver({super.key, required this.game});

//   @override
//   State<GameOver> createState() => _GameOverState();
// }

// class _GameOverState extends State<GameOver> {
//   @override
//   void initState() {
//     super.initState();
//     try { widget.game.pauseEngine(); } catch (_) {}
//   }

//   @override
//   void dispose() {
//     try { widget.game.resumeEngine(); } catch (_) {}
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
//     const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

//     return Material(
//       color: Colors.transparent,
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           height: 200,
//           width: 300,
//           decoration: BoxDecoration(
//             color: blackTextColor,
//             borderRadius: BorderRadius.all(
//               Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Game Over',
//                 style: TextStyle(
//                   color: whiteTextColor,
//                   fontSize: 24,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               SizedBox(
//                 width: 200,
//                 height: 75,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       await widget.game.reset();
//                       widget.game.overlays.remove('GameOver');
//                       widget.game.resumeEngine();
//                     } catch (_) {}
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: whiteTextColor,
//                   ),
//                   child: const Text(
//                     'Play Again',
//                     style: TextStyle(
//                       fontSize: 28.0,
//                       color: blackTextColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class GameOver extends StatelessWidget {
  final PixelAdventure game; // 1. Define it

  const GameOver({super.key, required this.game}); // 2. Require it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => game.overlays.remove('GameOver'),
          child: const Text('Try Again'),
        ),
      ),
    );
  }
}