import 'package:flutter/material.dart';

// --- Example 4: An Event Ticket/Invitation ---
// This design mimics a ticket stub, using a Row with an Expanded widget
// to separate details from a scannable code.
class EventTicketExample extends StatelessWidget {
  const EventTicketExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF34495e),
      appBar: AppBar(
        title: const Text('Event Ticket Design'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color(0xFFecf0f1),
            child: Row(
              children: [
                // Expanded widget ensures this column takes up available space.
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FLUTTER DEV MEETUP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF2c3e50),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text.rich(TextSpan(children: [
                          TextSpan(text: 'Hosted by '),
                          TextSpan(
                              text: 'Code & Coffee',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ])),
                        SizedBox(height: 20),
                        Row(children: [
                          Text('📅', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text('Sept 28, 2025'),
                        ]),
                        SizedBox(height: 8),
                        Row(children: [
                          Text('📍', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text('123 Flutter Lane'),
                        ]),
                      ],
                    ),
                  ),
                ),
                // This column for the date and QR code is not expanded.
                Container(
                  width: 110,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      const Text('SEP',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text('28',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Image.network(
                        'https://placehold.co/80x80/000000/ffffff?text=SCAN',
                        width: 80,
                        height: 80,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                              width: 80,
                              height: 80,
                              color: Colors.black12,
                              child: const Center(
                                  child: Icon(Icons.qr_code,
                                      color: Colors.black54)));
                        },
                      ),
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
