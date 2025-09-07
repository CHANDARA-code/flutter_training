import 'package:flutter/material.dart';

class AllClipBehaviorsExample extends StatelessWidget {
  const AllClipBehaviorsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('All Clip Behaviors'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Example Card for each Clip behavior
          BehaviorCard(
            clipBehavior: Clip.none,
            title: 'Clip.none',
            subtitle: 'Content overflows the card.',
          ),
          SizedBox(height: 20),
          BehaviorCard(
            clipBehavior: Clip.hardEdge,
            title: 'Clip.hardEdge',
            subtitle: 'Fast clipping, jagged edges.',
          ),
          SizedBox(height: 20),
          BehaviorCard(
            clipBehavior: Clip.antiAlias,
            title: 'Clip.antiAlias (Default for Card)',
            subtitle: 'Smoothed edges, good quality.',
          ),
          SizedBox(height: 20),
          BehaviorCard(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: 'Clip.antiAliasWithSaveLayer',
            subtitle: 'Smoothed, for complex cases.',
          ),
        ],
      ),
    );
  }
}

// A reusable card widget to demonstrate the behavior
class BehaviorCard extends StatelessWidget {
  final Clip clipBehavior;
  final String title;
  final String subtitle;

  const BehaviorCard({
    super.key,
    required this.clipBehavior,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Assign the specific clip behavior
      clipBehavior: clipBehavior,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 5,
      child: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?q=80&w=1887',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
