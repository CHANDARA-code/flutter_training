import 'package:flutter/material.dart';

// This example showcases a product detail screen.
// A Stack is used to place a "SALE" banner over the product image.
// Row and Column are used to structure the product information below the image.

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the main screen layout.
    return Scaffold(
      // AppBar at the top of the screen.
      appBar: AppBar(
        backgroundColor: Colors.red,
        // The title is a simple Text widget.
        title: const Text('Product Details Design'),
      ),
      backgroundColor: const Color(0xFF232730),
      // The body contains the main content, structured in a Column.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Stack allows overlaying widgets, perfect for the sale tag on the image.
          Stack(
            children: <Widget>[
              // The main product Image.
              Image.network(
                'https://i.ytimg.com/vi/f64GdOxJjPE/maxresdefault.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Positioned allows precise placement of children in a Stack.
              // Here, we place the "SALE" Card in the top-left corner.
              Positioned(
                top: 16.0,
                left: 16.0,
                // Card gives the sale tag a nice container.
                child: Card(
                  color: Colors.deepOrange,
                  child: Row(
                    // Using a Row to add some internal spacing
                    children: const [
                      SizedBox(width: 8),
                      Text(
                        'SALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // A Row to place the product name and price side-by-side.
          Row(
            // mainAxisAlignment is not used here to keep them together.
            children: const <Widget>[
              // Column for the product title and category.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '   Modern Armchair', // Spaces for fake padding
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                  Text(
                    '   Home & Decor',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          // A Card to contain the product description.
          Card(
            color: const Color(0xFF333742),
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text.rich with TextSpan allows for rich, styled text.
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                        fontSize: 16.0, color: Colors.white70, height: 1.5),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Description:\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white)),
                      const TextSpan(
                          text:
                              'This chair combines a minimalist design with exceptional comfort. '),
                      TextSpan(
                        text: 'Perfect for any modern living space.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.tealAccent[100]),
                      ),
                      const TextSpan(
                          text: '\n\nIn Stock: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: '5 items left'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Text widget for the price, styled differently.
          Row(
            children: const [
              Text(
                '    Price: \$249.99',
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
