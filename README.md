# Offline Ludo

A modern, offline local-multiplayer Ludo game built with Flutter. Play with up to 4 friends seamlessly over a local Wi-Fi network or hotspot without needing an active internet connection!

## Features

- 📶 **Local Wi-Fi Multiplayer**: Connect and play seamlessly using a Host-Client WebSocket architecture over a local network.
- 🎨 **Modern Aesthetics**: A beautifully crafted, responsive UI with smooth animations, dynamic color themes, and confetti victory screens.
- 🎵 **Rich Audio**: Immersive sound effects for dice rolls, token hops, capturing opponents, and returning home. Includes full volume/mute controls.
- ⚙️ **Robust Rule Engine**: Fully implemented standard Ludo rules, including rolling a 6 to exit home, capturing opponent tokens, and bonus turns.
- 🚀 **Production Ready**: Optimized for 60 FPS performance on Android, with robust error handling and network resilience (heartbeats, packet drop recovery).

## Game Rules

The game follows traditional Ludo mechanics:
1. **Starting**: Each player starts with 4 tokens in their home base. You must roll a **6** to move a token out of the home base onto the start cell.
2. **Movement**: Tokens move clockwise around the board based on the dice roll.
3. **Capturing**: If a token lands on a non-safe cell occupied by an opponent's token, the opponent's token is captured and sent back to their home base. You earn a **bonus turn** for capturing.
4. **Safe Zones**: Star-marked cells (and the colored start cells) are safe zones. Tokens cannot be captured while resting on these cells.
5. **Bonus Turns**: You earn an extra turn if you roll a **6**, capture an opponent, or bring a token to the finish triangle. *(Note: Rolling three 6s in a row incurs a penalty and skips your turn).*
6. **Winning**: The first player to bring all 4 of their tokens to the central finish triangle wins the game!

## How to Play (Multiplayer)

1. Ensure all devices are connected to the **same Wi-Fi network** (or have one device host a Mobile Hotspot and connect the others to it).
2. **Player 1 (Host)** taps **"Host Game"** on the main menu, enters a nickname, and creates a lobby.
3. The lobby will display a **Room Code** (the host's local IP address, e.g., `192.168.1.5`).
4. **Other Players (Clients)** tap **"Join Game"** on their main menu, enter their nickname, and type the Host's Room Code to connect.
5. Once everyone is in the lobby and marks themselves as **"READY"**, the host can tap **"START GAME"**.

## Technical Architecture

The game utilizes a decentralized, authoritative-server model entirely on the local device:
- **State Management**: `flutter_riverpod` handles UI reactivity and dependency injection.
- **Networking**: Dart's native `HttpServer` and `WebSocketTransformer` manage the host server, while `WebSocket` handles client connections.
- **Data Serialization**: `freezed` and `json_serializable` generate robust packet payloads.
- **Game Engine**: A pure Dart `RuleEngine` deterministically validates all moves on the host side, ensuring clients cannot cheat.

## Getting Started / Development

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
- Android Studio / Xcode for device emulation
- VS Code or your preferred IDE

### Build Instructions

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd Offline_ludo
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Freezed/JSON models (if modifying state or packets)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

5. **Build APK for Android**
   ```bash
   flutter build apk --release
   ```

## Acknowledgements
- Built as part of an AI-assisted advanced agentic coding project using Google DeepMind's Antigravity platform.
