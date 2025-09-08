import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimpleRowColExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Manual layout version using Row/Column
class SimpleRowColExample extends StatelessWidget {
  const SimpleRowColExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Row/Col Example'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          _buildItemRow(),
          Divider(
            height: 1,
          ),
          _buildItemRow(),
          Divider(
            height: 1,
          ),
          _buildItemRow(),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }

  Row _buildItemRow({
    enbaleIconArrow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  Text("Subtile"),
                ],
              ),
            ),
          ],
        ),
        Icon(
          Icons.forward_10_outlined,
          color: Colors.pink,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ],
    );
  }

  Widget _buildRow(
    IconData icon,
    String title,
    String subtitle, {
    bool enabled = true,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.green,
              child: Row(
                children: [
                  Icon(icon, color: enabled ? Colors.black : Colors.grey),
                  const SizedBox(width: 16),
                  _buildVerticalText(title, enabled, subtitle),
                ],
              ),
            ),
            Text("data"),
            if (onTap != null && enabled)
              Container(
                  color: Colors.blue,
                  child: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Column _buildVerticalText(String title, bool enabled, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: enabled ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: enabled ? Colors.black54 : Colors.grey,
          ),
        ),
      ],
    );
  }
}
