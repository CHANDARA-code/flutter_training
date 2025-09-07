import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: CardIntermediate(),
  ));
}

class CardIntermediate extends StatelessWidget {
  const CardIntermediate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Basic"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Card(
                elevation: 12.0,
                color: Colors.amber,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      "data",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xaa8a8a).withOpacity(1),
                      offset: Offset(-4, 9),
                      blurRadius: 38,
                      spreadRadius: -3,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
