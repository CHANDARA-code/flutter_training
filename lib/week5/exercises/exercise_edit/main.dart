import 'package:flutter/material.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_1.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_10.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_11.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_2.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_3.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_4.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_5.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_6.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_7.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_8.dart';
import 'package:training/week5/exercises/exercise_edit/exercise_9.dart';

// Main entry point of the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Using Inter font for a clean, modern look
        fontFamily: 'Inter',
        // Defining a card theme for consistency
        cardTheme: CardTheme(
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// A simple home page to navigate to the three examples
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Design Examples'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Example 1: Profile Card'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileCardExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 2: Travel Post'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelPostExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 3: Product Display'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDisplayExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 4: Event Ticket'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventTicketExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 5: Recipe Card'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecipeCardExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 6: Music Player UI'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MusicPlayerExample()),
                  );
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 7: UserProfileCard'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfileCard(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 8: Product Detail'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 9: Financial Summary Card'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinancialCardExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 10: Weather Card'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeatherCardExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Example 11: Review Card'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewCardExample(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
