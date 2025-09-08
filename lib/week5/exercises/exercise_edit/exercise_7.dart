import 'package:flutter/material.dart';

// This example demonstrates a common user profile card layout.
// It focuses on using a Stack to overlay a profile picture on a banner image,
// and a Row to display user stats side-by-side.

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic app structure (app bar, body).
    return Scaffold(
      // AppBar is the header of the screen.
      appBar: AppBar(
        // The title is a simple Text widget.
        title: const Text('Profile Card Design'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.blueGrey[700],
      // The body of the Scaffold holds the main content.
      body: Column(
        children: [
          // Card provides a rounded-corner container with a shadow.
          Card(
            margin: const EdgeInsets.all(20.0),
            color: Colors.blueGrey[800],
            child: Column(
              // The main layout inside the card is a Column to stack elements vertically.
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Stack allows us to place widgets on top of each other.
                Stack(
                  // We use clip.none to allow the avatar to overflow the banner.
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // First widget in the Stack: the banner Image.
                    Image.network(
                      'https://theninehertz.com/wp-content/uploads/2020/02/design.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      // errorBuilder provides a fallback if the banner image fails.
                      errorBuilder: (context, error, stackTrace) {
                        return Card(
                          color: Colors.grey[300],
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Banner not available'),
                            ],
                          ),
                        );
                      },
                    ),
                    // Second widget in the Stack: the profile picture, positioned to overlap.
                    // It's placed at a negative bottom to hang below the banner.
                    Positioned(
                      bottom: -50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          'https://www.hartz.com/wp-content/uploads/2022/04/small-dog-owners-1.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          // errorBuilder provides a fallback for the avatar image.
                          errorBuilder: (context, error, stackTrace) {
                            return Card(
                              color: Colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('!',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // This empty Column is used as a spacer. Since we can't use SizedBox,
                // we create an empty space this way. This is 50px for the avatar radius
                // plus 20px of extra space.
                const Column(children: [SizedBox(height: 70)]),
                // A Text widget for the user's name.
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // A Row to display user statistics horizontally.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // Each stat is a Column containing two Text widgets.
                    Column(
                      children: const [
                        Text('1,258',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('Posts',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('15.8K',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('Followers',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('789',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('Following',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                // Another empty Column for spacing.
                const Column(children: [SizedBox(height: 20)]),
                // Using Text with TextSpan for a styled bio description.
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Bio: Crafting beautiful apps with '),
                      TextSpan(
                        text: 'Flutter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue[300]),
                      ),
                      const TextSpan(
                          text: '. Helping students learn layout design.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Column(children: [
                  SizedBox(height: 20),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
