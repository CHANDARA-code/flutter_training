import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ClipMiniDemo()));

class ClipMiniDemo extends StatelessWidget {
  const ClipMiniDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card clipBehavior – simple')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DemoCard(title: 'Clip.none', behavior: Clip.none),
          SizedBox(height: 12),
          DemoCard(title: 'Clip.hardEdge', behavior: Clip.hardEdge),
          SizedBox(height: 12),
          DemoCard(
            title: 'Clip.antiAlias',
            behavior: Clip.antiAlias,
          ),
          SizedBox(height: 12),
          DemoCard(
            title: 'Clip.antiAliasWithSaveLayer',
            behavior: Clip.antiAliasWithSaveLayer,
            showBlurChip: true,
          ),
        ],
      ),
    );
  }
}

class DemoCard extends StatelessWidget {
  final String title;
  final Clip behavior;
  final bool showBlurChip;

  const DemoCard({
    super.key,
    required this.title,
    required this.behavior,
    this.showBlurChip = false,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 20.0;

    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: behavior,
      elevation: 4,
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            // simple background to show edge smoothness
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3F51B5), Color(0xFF1A237E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // 1) an overflowing badge that only escapes with Clip.none
            Positioned(
              right: -18, // hangs outside the card
              top: -12,
              child: Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF7043),
                ),
                child: const Text('★',
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
            ),

            // 2) a circle touching rounded corners (jaggy vs smooth between hardEdge and antiAlias)
            Positioned(
              left: -30,
              bottom: -30,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x66FFFFFF),
                ),
              ),
            ),

            // 3) small blur chip (really shows why saveLayer matters)
            if (showBlurChip)
              Positioned(
                left: 16,
                bottom: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('blur chip',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),

            // label
            Positioned(
              left: 16,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(title, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
