import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Border? border;

  const AppContainer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.color = Colors.blue,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(
            12,
          ),
        ),
      ),
      child: Text("Container"),
    );
  }
}
