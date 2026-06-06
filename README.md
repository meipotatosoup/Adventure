# Pixel Adventure

A fun 2D platformer game built with Flutter and the Flame game engine. Explore levels, collect items, and overcome obstacles!

## 🎮 Features

- 2D pixel art platformer gameplay
- Multiple levels with Tiled map support
- Character movement and collision detection
- Collectible items and checkpoints
- Cross-platform support (Windows, macOS, Linux, iOS, Android, Web)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 3.10.8 or higher) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Git** - [Install Git](https://git-scm.com/)
- Platform-specific requirements:
  - **Windows**: Visual Studio 2022 with C++ support
  - **macOS**: Xcode and CocoaPods
  - **Linux**: build-essential, cmake, pkg-config, libgtk-3-dev

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/meipotatosoup/Adventure.git
cd Adventure
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Project

**For Desktop (Windows, macOS, or Linux):**

```bash
flutter run -d windows    # Windows
flutter run -d macos      # macOS
flutter run -d linux      # Linux
```

**For Mobile (iOS or Android):**

```bash
flutter run -d ios        # iOS (macOS only)
flutter run -d android    # Android
```

**For Web:**

```bash
flutter run -d web
```

## 🎮 Game Controls

| Action | Control |
|--------|---------|
| Move Left | `A` or Left Arrow |
| Move Right | `D` or Right Arrow |
| Jump | `Space` or `W` |
| Double Jump | `Space` twice |
| Pause | `ESC` |

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── pixel_adventure.dart      # Game class
└── components/
    ├── background_tile.dart  # Background tiles
    ├── checkpoint.dart       # Level checkpoints
    ├── collision_block.dart  # Collision blocks
    ├── custom_hitbox.dart    # Custom hitbox for collisions
    ├── fruit.dart            # Collectible items
    ├── level.dart            # Level management
    ├── player.dart           # Player character
    └── utils.dart            # Utility functions

assets/
├── images/
│   ├── Background/           # Background assets
│   ├── Items/               # Item sprites
│   ├── Main Characters/     # Player sprites
│   ├── Menu/                # Menu assets
│   ├── Other/               # Miscellaneous sprites
│   ├── Terrain/             # Terrain tiles
│   └── Traps/               # Trap sprites
└── tiles/
    ├── Level-01.tmx         # Tiled map file for level 1
    ├── Level-02.tmx         # Tiled map file for level 2
    └── Pixel Adventure.tsx  # Tiled tileset
```

## 🛠️ Development

### Running in Debug Mode

```bash
flutter run
```

### Building for Release

**Windows:**
```bash
flutter build windows --release
```

**macOS:**
```bash
flutter build macos --release
```

**Linux:**
```bash
flutter build linux --release
```

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

### Code Analysis

```bash
flutter analyze
```

### Format Code

```bash
dart format lib/
```

## 📦 Dependencies

- **[Flame](https://flame-engine.org/)** - 2D game engine for Flutter
- **[Flame Tiled](https://pub.dev/packages/flame_tiled)** - Tiled map support for Flame
- **[Flutter Lints](https://pub.dev/packages/flutter_lints)** - Linting rules

## 🐛 Troubleshooting

### Issue: "Cannot run on device" 

Make sure you have a valid device connected or emulator running:
```bash
flutter devices
```

### Issue: Pub get fails

Clear the pub cache and try again:
```bash
flutter clean
flutter pub get
```

### Issue: Build fails on Android

Update your Android dependencies:
```bash
cd android
./gradlew clean
cd ..
flutter pub get
flutter run -d android
```

## 📝 License

This project is provided as-is for personal use.

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements!

## 📧 Support

If you have any questions or encounter issues, please open an issue on the repository.

---

Happy gaming! 🎮
