import 'package:flutter/material.dart';

// --- Example 9: A User Review/Testimonial Card ---
// A simple, elegant card to display a quote or review.
// It uses Text.rich to style the quotation marks differently.
class ReviewCardExample extends StatelessWidget {
  const ReviewCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User Testimonial'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color(0xFF6c5ce7),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Main review text with styled quote marks
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: '“ ',
                          style:
                              TextStyle(fontSize: 28, color: Colors.white54)),
                      TextSpan(
                        text:
                            'This is the best app I have ever used. It\'s intuitive, beautiful, and has saved me so much time. A must-have!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            height: 1.4),
                      ),
                      TextSpan(
                          text: ' ”',
                          style:
                              TextStyle(fontSize: 28, color: Colors.white54)),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // User info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://placehold.co/80x80/ffffff/6c5ce7?text=S',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey[200],
                                child: const Icon(Icons.person,
                                    color: Colors.grey));
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Samantha Bee',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Text('Verified Customer',
                              style: TextStyle(color: Colors.white70)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
