// --- Example 1: A User Profile Card ---
// This example demonstrates stacking images and organizing text details vertically.
import 'package:flutter/material.dart';

class ProfileCardExample extends StatelessWidget {
  const ProfileCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic app layout structure.
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // AppBar at the top of the screen.
      appBar: AppBar(
        title: const Text('Profile Card Design'),
        backgroundColor: Colors.red,
      ),
      // The body contains the main content.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Card provides a container with a shadow.
          Card(
            clipBehavior:
                Clip.antiAlias, // Ensures content respects the rounded corners
            child: Column(
              children: [
                // Stack allows widgets to be layered on top of each other.
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    // Background banner image.
                    Image.network(
                      'https://www.krones.com/media/images/KHB_Product_Family_20230102_1240x826px.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      // Renders a placeholder widget if the image fails to load.
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                              child: Icon(Icons.broken_image,
                                  color: Colors.grey, size: 48)),
                        );
                      },
                    ),
                    // Profile avatar image, stacked on top of the banner.
                    // The padding gives it a nice border effect.
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      // Using a Card with CircleBorder to easily add error handling for the avatar.
                      child: Card(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        elevation: 4.0,
                        child: Image.network(
                          'https://www.khmerbeverages.com/wp-content/uploads/2021/01/Hea-Petter.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[200],
                              child: const Icon(Icons.person,
                                  size: 60, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // A Column to hold the user's text information.
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User's name.
                      Text(
                        'Aria Cruz',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      // User's handle/title.
                      Text(
                        '@ariacruz_designs',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // A bio using TextSpan for different styles in one Text widget.
                      Text.rich(
                        TextSpan(
                          text: 'Creative Director at ',
                          style: TextStyle(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '#PixelPerfect',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            TextSpan(
                                text:
                                    '. Turning ideas into beautiful realities.'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // A Row to display stats horizontally.
                      Row(
                        children: [
                          Text('2,150',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text('Following',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 24),
                          Text('15.7K',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text('Followers',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      )
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
