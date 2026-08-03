# Product

<!-- impeccable:product-schema 1 -->

## Platform

android

## Stack

Flutter, Riverpod, Freezed, WebSockets

## Users
Players who want to play Ludo with their friends locally on the same Wi-Fi network without requiring an active internet connection.

## Product Purpose
To provide a fun, seamless, and completely offline local multiplayer Ludo experience. Success is a robust lobby system, smooth gameplay, and no phantom disconnects.

## Positioning
A truly local, decentralized Ludo game where one player's device acts as an authoritative host server, guaranteeing low latency and no dependency on external cloud servers.

## Operating Context
Players are likely in the same room, connecting to a local Wi-Fi router or a mobile hotspot.

## Capabilities and Constraints
- Must function entirely without internet access.
- Requires `INTERNET` permission solely for binding local sockets (0.0.0.0).
- Supports 2-4 players.
- Follows standard Ludo rules (roll 6 to exit, captures grant bonus turn, etc.).

## Brand Commitments
- Name: Anti Gravity Ludo
- Colors: Classic Ludo Red, Green, Yellow, Blue.

## Evidence on Hand
- Working core game engine, networking stack, and lobby UI.
- `app-release.apk` is the deployment target.

## Product Principles
1. **Zero Configuration**: Joining a game should only require typing an IP address.
2. **Authoritative State**: The host dictates the game state to prevent cheating or desync.
3. **Resilience**: The network layer must recover from packet drops and allow reconnections.
