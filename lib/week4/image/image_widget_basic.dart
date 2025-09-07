import 'package:flutter/material.dart';
import 'package:training/week4/image/app_text_widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: ImageWidgetBasic(),
  ));
}

class ImageWidgetBasic extends StatelessWidget {
  const ImageWidgetBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget Basic"),
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextWidget(text: "text"),
          SizedBox(
              width: 60,
              height: 60,
              child: Image.asset('assets/images/dog.webp')),
          SizedBox(
            width: 60,
            height: 60,
            child: Image.network(
              'https://picsum.photos/id/237/300/200',
              width: 220,
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Image.network(
              'https://picsum.photos/id/237/300/200',
            ),
          ),
        ],
      ),
    );
  }
}
