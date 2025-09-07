import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: StackWidget()),
        ),
      ),
    );

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget>
    with TickerProviderStateMixin {
  late final AnimationController _badgeCtrl;
  late final AnimationController _circleCtrl;

  bool _playing = true;

  @override
  void initState() {
    super.initState();

    // 1. star-badge "breathing"
    _badgeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // 2. slow rotation for halo circle
    _circleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _badgeCtrl.dispose();
    _circleCtrl.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      _playing = !_playing;
      if (_playing) {
        _badgeCtrl.repeat(reverse: true);
        _circleCtrl.repeat();
      } else {
        _badgeCtrl.stop();
        _circleCtrl.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _togglePlay, // tap anywhere to pause / resume
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            // gradient background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff405db5), Color(0xff004e8f)],
                    stops: [0.45, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // animated star badge
            Positioned(
              right: -18,
              top: -12,
              child: ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.15).animate(CurvedAnimation(
                  parent: _badgeCtrl,
                  curve: Curves.easeInOut,
                )),
                child: Container(
                  alignment: Alignment.center,
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF7043),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '★',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),

            // animated halo circle
            Positioned(
              left: -30,
              bottom: -30,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_circleCtrl),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x66FFFFFF),
                  ),
                ),
              ),
            ),

            // label
            const Positioned(
              left: 12,
              top: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    'Label',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
