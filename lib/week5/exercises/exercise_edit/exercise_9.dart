import 'package:flutter/material.dart';

// --- Example 7: A Financial Summary Card ---
// This design uses Rows and Columns to create a clean, modern layout
// for displaying financial information.
class FinancialCardExample extends StatelessWidget {
  const FinancialCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f6fa),
      appBar: AppBar(
        title: const Text('Financial Summary'),
        backgroundColor: const Color(0xFF0abde3),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section with balance and a logo
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Current Balance',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          SizedBox(height: 4),
                          Text('\$1,250.75',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Image.network(
                        'https://placehold.co/60x60/0abde3/ffffff?text=Logo',
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey[200],
                              child: const Icon(Icons.business,
                                  color: Colors.grey));
                        },
                      ),
                    ],
                  ),
                ),

                // Divider
                Container(height: 1, color: Colors.grey[200]),

                // Recent Transactions section
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: Text('Recent Activity',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),

                // Transaction Item 1 (Debit)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    children: [
                      const Card(
                          shape: CircleBorder(),
                          color: Color(0xFFff7979),
                          elevation: 0,
                          child: SizedBox(width: 10, height: 10)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Spotify Subscription',
                              style: TextStyle(fontSize: 14))),
                      const Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '-\$9.99',
                            style: TextStyle(
                                color: Color(0xFFff7979),
                                fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                ),
                // Transaction Item 2 (Credit)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    children: [
                      const Card(
                          shape: CircleBorder(),
                          color: Color(0xFFbadc58),
                          elevation: 0,
                          child: SizedBox(width: 10, height: 10)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Client Payment',
                              style: TextStyle(fontSize: 14))),
                      const Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '+\$300.00',
                            style: TextStyle(
                                color: Color(0xFFbadc58),
                                fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
