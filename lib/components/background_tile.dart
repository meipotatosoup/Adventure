

import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class BackgroundTile extends SpriteComponent with HasGameReference<PixelAdventure> {
  final String color;
  BackgroundTile({this.color = "Gray", position}) : super(position: position,);

  @override
  FutureOr<void> onLoad()   {
    priority = -1; // Ensure background tiles are rendered behind other components.
    size = Vector2.all(64.6);
    sprite = Sprite(game.images.fromCache('Background/$color.png'));
    return super.onLoad();
  }
}git push -u origin main