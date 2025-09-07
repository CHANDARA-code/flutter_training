import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: StackWidget()));
}

class StackWidget extends StatelessWidget {
  final bool showBlurChip;
  final String title;
  const StackWidget(
      {super.key, this.showBlurChip = false, this.title = "title"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          _buildStack(),
        ],
      ),
    );
  }

  Widget _buildStack() {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff405db5), Color(0xff004e8f)],
                  stops: [0.45, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
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
          ),
          Positioned(
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
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Lable",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
