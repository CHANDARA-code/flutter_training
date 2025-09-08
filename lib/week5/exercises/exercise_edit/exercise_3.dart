import 'package:flutter/material.dart';

// --- Example 3: A Product Display Card ---
// This design uses a Row to place an image and text side-by-side,
// perfect for an e-commerce item list.
class ProductDisplayExample extends StatelessWidget {
  const ProductDisplayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Display Design'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stack for the product image and a "Sale" tag.
                Stack(
                  children: [
                    // The main product image.
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://stormwatches.com/cdn/shop/files/S-HERO_SMART_WATCH_BLACK_5fb5a97c-c460-4b28-9a4c-44752df77273.jpg?v=1702317863&width=1946',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 120,
                              height: 120,
                              color: Colors.grey[200],
                              child: const Icon(Icons.broken_image,
                                  size: 40, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                    // A simple "Sale" tag card overlay.
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Card(
                        color: const Color(0xFFe74c3c),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'SALE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Expanded widget makes the Column take up the remaining space in the Row.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vintage Leather Watch',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Accessories',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Row for star rating (simulated with Text widgets).
                        const Row(
                          children: [
                            Text('⭐', style: TextStyle(fontSize: 16)),
                            Text('⭐', style: TextStyle(fontSize: 16)),
                            Text('⭐', style: TextStyle(fontSize: 16)),
                            Text('⭐', style: TextStyle(fontSize: 16)),
                            Text('⭐',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Price display using Text.rich and TextSpan for styling.
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$120.00  ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: '\$79.99',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFFc0392b),
                                ),
                              ),
                            ],
                          ),
                        ),
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
