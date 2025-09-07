import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: CardBasic(),
  ));
}

class CardBasic extends StatelessWidget {
  const CardBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Basic"),
      ),
      body: Column(
        children: [
          Card(
            child: Text("data"),
          ),
          Card(
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "data",
                ),
              ),
            ),
          ),
          Card(
            color: Colors.amber,
            child: SizedBox(
              width: 280,
              height: 280,
              child: Center(
                child: Text(
                  "data",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
