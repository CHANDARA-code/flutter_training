import 'package:flutter/material.dart';

// --- Example 5: A Recipe Card ---
// This design stacks a title over an image and uses a Row for key info,
// demonstrating a common layout for content like recipes or articles.
class RecipeCardExample extends StatelessWidget {
  const RecipeCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbe9e7),
      appBar: AppBar(
        title: const Text('Recipe Card Design'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.network(
                      'https://www.simplyrecipes.com/thmb/K54cPz_L-7C6csildu5TVbexEGY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/simply-recipes-creole-spaghetti-lead-3-3dea2465b8ee46458f5bcfa6e936af72.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                              child: Icon(Icons.restaurant_menu,
                                  color: Colors.grey, size: 48)),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Classic Spaghetti',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(blurRadius: 10)]),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A timeless Italian dish perfect for any night of the week. Quick, easy, and delicious.',
                        style: TextStyle(color: Colors.black54, height: 1.4),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Text('Prep Time',
                                style: TextStyle(color: Colors.grey)),
                            Text('10 min',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                          Column(children: [
                            Text('Cook Time',
                                style: TextStyle(color: Colors.grey)),
                            Text('20 min',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                          Column(children: [
                            Text('Servings',
                                style: TextStyle(color: Colors.grey)),
                            Text('4',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
