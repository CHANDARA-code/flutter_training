import 'package:flutter/material.dart';

// --- Example 2: A Travel Destination Post ---
// This design focuses on overlaying text on an image and structuring content
// like a social media post.
class TravelPostExample extends StatelessWidget {
  const TravelPostExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Travel Post Design'),
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
                // Stack is used to place text over the main image.
                Stack(
                  children: [
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6b/27/58/caption.jpg?w=1200&h=-1&s=1',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          color: Colors.grey[300],
                          child: const Center(
                              child: Icon(Icons.broken_image,
                                  color: Colors.grey, size: 48)),
                        );
                      },
                    ),
                    // Positioned widget allows precise placement within the Stack.
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sunset in Bali',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [Shadow(blurRadius: 10.0)],
                            ),
                          ),
                          Text(
                            'An unforgettable experience',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              shadows: [Shadow(blurRadius: 8.0)],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // A Row for the author's information.
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Card(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        child: Image.network(
                          'https://www.nylabone.com/-/media/project/oneweb/nylabone/images/dog101/10-intelligent-dog-breeds/golden-retriever-tongue-out.jpg?h=430&w=710&hash=7FEB820D235A44B76B271060E03572C7',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 40,
                              height: 40,
                              color: Colors.grey[200],
                              child: const Icon(Icons.person,
                                  size: 24, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Column for name and post time.
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leo Venture',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Posted 2 hours ago',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // The post's description, using TextSpan for emphasis.
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 14, height: 1.5),
                      children: [
                        TextSpan(text: 'This was one of the most '),
                        TextSpan(
                          text: 'breathtaking sunsets',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                            text:
                                ' I have ever witnessed. The colors were just magical. Highly recommend a visit!'),
                      ],
                    ),
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
