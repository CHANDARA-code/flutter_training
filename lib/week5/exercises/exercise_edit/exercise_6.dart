import 'package:flutter/material.dart';

// --- Example 6: A Music Player UI Snippet ---
// A simple, bold design focusing on album art. It uses a Column to
// vertically arrange the image, song title, and artist name.
class MusicPlayerExample extends StatelessWidget {
  const MusicPlayerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Music Player UI'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color(0xFF1e1e1e),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Album artwork with a Stack to overlay a play icon.
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          'https://placehold.co/600x600/7b1fa2/ffffff?text=Album+Art',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 300,
                              color: Colors.black26,
                              child: const Center(
                                  child: Icon(Icons.music_note,
                                      color: Colors.white54, size: 100)),
                            );
                          },
                        ),
                      ),
                      // A decorative card to simulate a play button
                      const Card(
                          color: Colors.white24,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('▶',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white)),
                          ))
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Song title
                  const Text(
                    'Dreaming On',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Artist name
                  const Text.rich(TextSpan(
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(text: 'by '),
                      TextSpan(
                        text: 'Lofi Chillhop',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
