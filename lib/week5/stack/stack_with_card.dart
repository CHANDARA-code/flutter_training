import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: StackWithCard()));
}

class StackWithCard extends StatelessWidget {
  final bool showBlurChip;
  final String title;
  const StackWithCard(
      {super.key, this.showBlurChip = false, this.title = "title"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack With Card"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildStack(),
        ),
      ),
    );
  }

  Widget _buildStack() {
    return SizedBox(
      height: 200,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8.0,
        child: Stack(
          children: [
            _buildBackground(
              isShowerImage: true,
            ),
            _buildStarWidget(),
            _buildHalfCircleWidget(),
            _buildBlurWidget(),
            _buildLabelTitle(),
          ],
        ),
      ),
    );
  }

  Positioned _buildLabelTitle() {
    return Positioned(
      left: 12,
      top: 12,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          "Feature Card",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Positioned _buildBlurWidget() {
    return Positioned(
      left: 16,
      bottom: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: EdgeInsets.all(4),
            child: Text(
              "Glass Effect",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned _buildHalfCircleWidget() {
    return Positioned(
      left: -30,
      bottom: -30,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x66FFFFFF),
        ),
      ),
    );
  }

  Positioned _buildStarWidget() {
    return Positioned(
      right: -18,
      top: -12,
      child: Container(
        alignment: Alignment.center,
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Color(0xFFFF7043),
          shape: BoxShape.circle,
        ),
        child: Text(
          "★",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Positioned _buildBackground(
      {bool isShowerImage = true,
      String imageUrl =
          "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"}) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff405db5), Color(0xff004e8f)],
            stops: [0.45, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isShowerImage
            ? Image.network(
                fit: BoxFit.cover,
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error_outline_rounded,
                    color: Colors.grey,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  );
                },
              )
            : null,
      ),
    );
  }
}
