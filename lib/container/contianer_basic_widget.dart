import 'package:flutter/material.dart';
import 'package:training/container/app_container.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(home: ContianerBasicWidget()),
  );
}

class ContianerBasicWidget extends StatelessWidget {
  const ContianerBasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    print(" WidthScreen: $widthScreen"); //393.0
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Basic"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AppContainer(
                  color: Colors.green,
                ),
                AppContainer(
                  color: Colors.green,
                  width: 80,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                border: null,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Text("Container"),
            ),
            SizedBox(
              height: 12,
            ),
            _buildContainer(
              width: 300,
              height: 30,
              border: Border.all(
                color: Colors.black,
                width: 5,
                style: BorderStyle.solid,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildContainer({
    double width = 100,
    double height = 100,
    Color color = Colors.red,
    BoxBorder? border,
  }) {
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
