import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';
import 'package:offline_ludo/core/ui/cyber_button.dart';
import 'package:offline_ludo/core/ui/cyber_text_field.dart';
import 'dart:math' as math;

class MainMenuScreen extends ConsumerStatefulWidget {
  const MainMenuScreen({super.key});

  @override
  ConsumerState<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<MainMenuScreen> with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  bool _isLoading = false;
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  Future<void> _createRoom() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('INITIATE PROTOCOL: PLEASE ENTER YOUR DESIGNATION (NAME)')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final service = ref.read(lobbyServiceProvider);
      await service.createRoom(_nameController.text.trim());
      if (mounted) {
        await context.push('/lobby');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('HOST PROTOCOL FAILED: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showJoinDialog() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('INITIATE PROTOCOL: PLEASE ENTER YOUR DESIGNATION (NAME)')),
      );
      return;
    }

    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => _JoinRoomDialog(playerName: _nameController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Animated Cosmic Background
          AnimatedBuilder(
            animation: _bgController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 2.0 + math.sin(_bgController.value * 2 * math.pi) * 0.1,
                    colors: [
                      AppColors.surfaceHighlight,
                      AppColors.background,
                    ],
                  ),
                ),
              );
            },
          ),
          
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Glowing Logo
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.casino_outlined,
                      size: 96,
                      color: AppColors.primary,
                      shadows: [Shadow(color: AppColors.primary, blurRadius: 20)],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Title
                  Text(
                    'ANTI GRAVITY\nLUDO',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      height: 1.1,
                      shadows: [
                        Shadow(color: AppColors.secondary.withOpacity(0.8), blurRadius: 20, offset: const Offset(0, 4)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                  
                  // Input Field
                  CyberTextField(
                    controller: _nameController,
                    labelText: 'OPERATIVE DESIGNATION',
                    prefixIcon: Icons.person_outline,
                    isUppercase: true,
                  ),
                  const SizedBox(height: 32),
                  
                  // Action Buttons
                  CyberButton(
                    onPressed: _createRoom,
                    label: 'INITIALIZE HOST',
                    icon: Icons.rocket_launch,
                    isPrimary: true,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 16),
                  CyberButton(
                    onPressed: _showJoinDialog,
                    label: 'CONNECT TO HOST',
                    icon: Icons.satellite_alt,
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _JoinRoomDialog extends ConsumerStatefulWidget {
  final String playerName;
  const _JoinRoomDialog({required this.playerName});

  @override
  ConsumerState<_JoinRoomDialog> createState() => _JoinRoomDialogState();
}

class _JoinRoomDialogState extends ConsumerState<_JoinRoomDialog> {
  final _codeController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _join() async {
    final code = _codeController.text.trim().toUpperCase();
    if (code.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final service = ref.read(lobbyServiceProvider);
      await service.joinRoom(code, widget.playerName);
      if (mounted) {
        context.pop(); // Close dialog
        await context.push('/lobby'); // Go to lobby
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CONNECTION FAILED: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.secondary.withOpacity(0.5), width: 2),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: AppColors.secondary.withOpacity(0.1), blurRadius: 40, spreadRadius: 10),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'UPLINK ESTABLISHMENT',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.secondary, letterSpacing: 2.0),
            ),
            const SizedBox(height: 24),
            CyberTextField(
              controller: _codeController,
              labelText: 'ENTER HOST COORDINATES (IP)',
              isUppercase: true,
              prefixIcon: Icons.radar,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _isLoading ? null : () => context.pop(),
                  child: Text('ABORT', style: TextStyle(color: AppColors.onSurfaceVariant, letterSpacing: 1.5)),
                ),
                const SizedBox(width: 16),
                CyberButton(
                  onPressed: _join,
                  label: 'UPLINK',
                  icon: Icons.cell_tower,
                  isPrimary: false,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
