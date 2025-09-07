import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ClipShowcase()));

class ClipShowcase extends StatelessWidget {
  const ClipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1116),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121722),
        title: const Text('Card clipBehavior – side by side'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, c) {
            final twoCols = c.maxWidth >= 680;
            return GridView.count(
              crossAxisCount: twoCols ? 2 : 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: twoCols ? 1.4 : 1.1,
              children: const [
                ClipCard(title: 'Clip.none', behavior: Clip.none),
                ClipCard(title: 'Clip.hardEdge', behavior: Clip.hardEdge),
                ClipCard(title: 'Clip.antiAlias', behavior: Clip.antiAlias),
                ClipCard(
                  title: 'Clip.antiAliasWithSaveLayer',
                  behavior: Clip.antiAliasWithSaveLayer,
                  showBackdropDemo: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ClipCard extends StatelessWidget {
  final String title;
  final Clip behavior;
  final bool showBackdropDemo;

  const ClipCard({
    super.key,
    required this.title,
    required this.behavior,
    this.showBackdropDemo = false,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 24.0;

    // Background behind all cards so BackdropFilter has something to blur.
    return Stack(
      children: [
        // Patterned background to make clipping + blur obvious.
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0E1116), Color(0xFF1C2333)],
                ),
              ),
              child: CustomPaint(painter: StripePainter()),
            ),
          ),
        ),
        Card(
          elevation: 8,
          color: const Color(0xFF161C28),
          shadowColor: Colors.black.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: Colors.white.withOpacity(0.06),
              width: 1,
            ),
          ),
          clipBehavior: behavior,
          child: Stack(
            children: [
              // Content gradient to show edge smoothness
              Positioned.fill(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1F2840), Color(0xFF19233B)],
                    ),
                  ),
                ),
              ),

              // (A) BIG OVERFLOW BADGE — clearly shows difference between none vs clipped.
              // The badge is intentionally offset so it sticks outside the card bounds.
              Positioned(
                right: -28, // <-- hangs outside
                top: -18,
                child: _ShinyBadge(),
              ),

              // (B) Decorative circle touching edges to show jaggy vs smooth corner clipping.
              Positioned(
                left: -40,
                bottom: -40,
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const RadialGradient(
                      radius: 0.9,
                      colors: [Color(0xFF3D7FFF), Color(0x001A237E)],
                    ),
                  ),
                ),
              ),

              // (C) Backdrop blur demo — only looks correct with antiAliasWithSaveLayer.
              // On other modes, you’ll either see no blur or odd blending at corners.
              if (showBackdropDemo)
                Positioned(
                  left: 24,
                  bottom: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.15)),
                        ),
                        child: const Text(
                          'Live blur (needs saveLayer)',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),

              // Title + caption
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitlePill(text: title),
                      const SizedBox(height: 12),
                      Text(
                        _explain(behavior),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          height: 1.25,
                        ),
                      ),
                      const Spacer(),
                      _Legend(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _explain(Clip b) {
    switch (b) {
      case Clip.none:
        return 'No clipping — the orange badge intentionally escapes the card.';
      case Clip.hardEdge:
        return 'Sharp clipping at bounds (can look jaggy on curves). Badge is cut.';
      case Clip.antiAlias:
        return 'Clips with smoothed edges. Badge is cut, corners look clean.';
      case Clip.antiAliasWithSaveLayer:
        return 'Anti-aliased clip + saveLayer. Blur/opacity blend correctly inside rounded clip.';
    }
  }
}

/// Big orange badge that intentionally overflows the card to visualize clipping.
class _ShinyBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Glow
        Positioned(
          left: -10,
          top: -10,
          child: Container(
            width: 74,
            height: 74,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 24, spreadRadius: 2, color: Color(0x66FFA726)),
              ],
            ),
          ),
        ),
        // Badge
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
            ),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 14,
                  offset: Offset(0, 6),
                  color: Color(0x55000000)),
            ],
          ),
          alignment: Alignment.center,
          child: const Text(
            '★',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

/// Label pill for each card
class _TitlePill extends StatelessWidget {
  final String text;
  const _TitlePill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

/// Legend items to guide the eye on what to look for.
class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final muted = Colors.white.withOpacity(0.7);
    return Wrap(
      spacing: 10,
      runSpacing: 6,
      children: [
        _dot('Overflowing badge', muted),
        _dot('Rounded corner edge', muted),
        _dot('Blur/opacity blending', muted),
      ],
    );
  }

  Widget _dot(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.circle, size: 8),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}

/// Diagonal stripes behind cards to make blur + edges obvious.
class StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..color = const Color(0x11FFFFFF);

    const gap = 36.0;
    for (double x = -size.height; x < size.width + size.height; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x + size.height, size.height), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
