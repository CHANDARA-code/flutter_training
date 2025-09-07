import 'package:flutter/material.dart';
import 'package:training/container/app_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row, Column & Image Example'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // Row takes minimum horizontal space
              children: [
                // 1. The Image
                Image.network(
                  'https://img.freepik.com/free-photo/closeup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_488145-3540.jpg?semt=ais_hybrid&w=740&q=80',
                  width: 80,
                  height: 80,
                ),
                AppContainer(
                  width: 12,
                ),
                const SizedBox(
                    width: 16), // Provides spacing between image and text

                // 2. The Column for text
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Aligns text to the left
                  mainAxisSize:
                      MainAxisSize.min, // Column takes minimum vertical space
                  children: [
                    Text(
                      'Flutter Dev',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5), // Spacing between title and subtitle
                    Text(
                      'UI Framework',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
