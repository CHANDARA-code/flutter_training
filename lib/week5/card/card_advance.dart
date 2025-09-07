import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: AdvancedCardExample(),
    ),
  );
}

class AdvancedCardExample extends StatelessWidget {
  const AdvancedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Card Example'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      // A slightly off-white background to make the card pop
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            // This ensures that the image corners are also rounded
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image section
                Image.network(
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1170',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // A fallback in case the image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 80,
                      ),
                    );
                  },
                ),

                // Descriptive text section
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Text(
                    'Explore the depths of this magical forest, where sunlight filters through the canopy. A perfect getaway from the hustle and bustle of city life.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.4, // Line spacing
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
