import 'package:flutter/material.dart';

// --- Example 8: A Weather Report Card ---
// This example uses a Stack to place a decorative element behind the
// main content, creating a sense of depth.
class WeatherCardExample extends StatelessWidget {
  const WeatherCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF487eb0),
      appBar: AppBar(
        title: const Text('Weather Report'),
        backgroundColor: const Color(0xFF40739e),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color(0xFF4a86cf),
            child: Stack(
              children: [
                // Background decorative image (a faint, oversized cloud)
                Positioned(
                  top: -50,
                  right: -50,
                  child: Image.network(
                    'https://placehold.co/200x200/ffffff/ffffff?text=.',
                    width: 200,
                    height: 200,
                    color: Colors.white.withOpacity(0.1),
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(width: 200, height: 200);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Main weather info Row
                      const Row(
                        children: [
                          Text('☀️', style: TextStyle(fontSize: 64)),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sunny',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text('Phnom Penh',
                                  style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          Spacer(),
                          Text('32°',
                              style: TextStyle(
                                  fontSize: 48,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Hourly forecast Row
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Text('Now',
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text('☀️', style: TextStyle(fontSize: 24)),
                            SizedBox(height: 4),
                            Text('32°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('10AM',
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text('☀️', style: TextStyle(fontSize: 24)),
                            SizedBox(height: 4),
                            Text('33°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('11AM',
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text('🌤️', style: TextStyle(fontSize: 24)),
                            SizedBox(height: 4),
                            Text('34°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('12PM',
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text('☁️', style: TextStyle(fontSize: 24)),
                            SizedBox(height: 4),
                            Text('33°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
