import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/components/background_tile.dart';
import 'package:pixel_adventure/components/checkpoint.dart';
import 'package:pixel_adventure/components/collision_block.dart';
import 'package:pixel_adventure/components/fruit.dart';
import 'package:pixel_adventure/components/player.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class Level extends World with HasGameReference<PixelAdventure> {
  final String levelName;
  final Player player;
  Level({required this.levelName, required this.player});
  late TiledComponent level;
  final List<CollisionBlock> collisionBlocks = [];

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);
    
    _scrollingBackground();
    _spawingObjects(); 
    _addCollisions();

    
    
    return super.onLoad();
  }
  
  void _scrollingBackground() {
    final backgroundLayer = level.tileMap.map.layerByName('Background');
    const tileSize = 64;

    final numTilesY = (game.size.y / tileSize).floor();
    final numTilesX = (game.size.x / tileSize).floor();

    final backgroundColor = backgroundLayer.properties.getValue<String>('BackgroundColor')
        ?? level.tileMap.map.properties.getValue<String>('BackgroundColor')
        ?? 'Gray';

    for (double y = 0; y < game.size.y / numTilesY; y++) {
      for (double x = 0; x < numTilesX; x++) {
        final backgroundTile = BackgroundTile(
          color: backgroundColor,
          position: Vector2(x * tileSize, y * tileSize - tileSize),
        );
        add(backgroundTile);
      }
    }
  }
  
  
  void _spawingObjects() {
    final spawPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if(spawPointsLayer != null) {
      for(final spawnPoint in spawPointsLayer.objects) {
        switch(spawnPoint.class_) {
          case 'Player':
            player.position = Vector2(spawnPoint.x, spawnPoint.y);
            add(player);
            break;
          case 'Fruit':
          final fruit = Fruit(
            fruit: spawnPoint.name,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(fruit); 
          break;
          case 'Checkpoint':
            final checkpoint = Checkpoint(
              position: Vector2(spawnPoint.x, spawnPoint.y),
              size: Vector2(spawnPoint.width, spawnPoint.height),
            );
            add(checkpoint);
            break;
          default:
        }
      }
    }
  }
  
  void _addCollisions() {
    final collisionLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');
    
    if(collisionLayer != null) {
      for(final collision in collisionLayer.objects) {
        switch (collision.class_) {
          case 'Platform':
            final platform = CollisionBlock(
              position: Vector2(collision.x, collision.y), 
              size: Vector2(collision.width, collision.height), 
              isPlatform: true,
            );
            collisionBlocks.add(platform);
            add(platform);
            break;
          default:
            final block = CollisionBlock (
              position: Vector2(collision.x, collision.y), 
              size: Vector2(collision.width, collision.height), 
              isPlatform: false,
            );
            collisionBlocks.add(block);
            add(block);
        }
      }
    }
    player.collisionBlocks = collisionBlocks;
  } 
}
