import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(home: RowWidget()),
  );
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Basic"),
      ),
      body: Container(
        height: 100,
        color: Colors.lightBlue.shade100,
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 50,
            ),
            Icon(
              Icons.star,
              size: 30,
            ),
            Icon(
              Icons.star,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
