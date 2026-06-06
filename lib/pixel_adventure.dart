


import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_adventure/components/player.dart';
import 'package:pixel_adventure/components/level.dart';

class PixelAdventure extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks, HasCollisionDetection {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  

  @override
  FutureOr<void> onLoad() async {
    //Load all the images into cache. 
    await images.loadAllImages();
    
    final world = Level(
      player: player,
      levelName: 'Level-02',
    );
    cam = CameraComponent.withFixedResolution(
        world: world,
      width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    
    addAll([world, cam]);

    return super.onLoad();
  }
  }
