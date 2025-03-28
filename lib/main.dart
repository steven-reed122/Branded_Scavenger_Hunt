import 'package:flutter/material.dart';
import 'level.dart'; // Import the LevelPage
import 'level_selector.dart';
import 'progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF461D7C)),
        useMaterial3: true,
        fontFamily: 'Proxima Nova', // Default font set
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: "Proxima Nova"),
          bodyMedium: TextStyle(fontFamily: "Proxima Nova"),
          bodySmall: TextStyle(fontFamily: "Proxima Nova"),
        ),
      ),
      home: const MyHomePage(title: 'PFT Scavenger Hunt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Track selected tab

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary reloads

    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LevelSelector()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProgressPage()),
      );
    }
    // For index 0 (home), we don't need to navigate since we're already on MyHomePage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF461D7C),
        toolbarHeight: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: 32,
            height: 24,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                'assets/images/LSU_logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading logo: $error');
                  return const Icon(
                    Icons.error_outline,
                    color: Color(0xFF461D7C),
                    size: 24,
                  );
                },
              ),
            ),
          ),
        ),
        title: const Text(
          'PFT Scavenger Hunt',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Proxima Nova',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF461D7C),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Main Title
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                'Welcome to the\nPFT Scavenger Hunt!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontFamily: 'Proxima Nova',
                  height: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            // Feature Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildFeatureCard(
                    icon: Icons.map,
                    title: 'Explore PFT',
                    description: 'Discover different locations and solve riddles throughout the building',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.quiz,
                    title: 'Solve Riddles',
                    description: 'Test your knowledge with fun and challenging riddles',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.track_changes,
                    title: 'Track Progress',
                    description: 'Keep track of your completed locations and achievements',
                  ),
                ],
              ),
            ),
            // Bottom Text
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Use the navigation bar below to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                  fontFamily: 'Proxima Nova',
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFFFDD023),
        unselectedItemColor: Color(0xFF461D7C),
        currentIndex: _selectedIndex, // Highlight selected tab
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontFamily: 'Proxima Nova'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Proxima Nova'),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Levels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Progress',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF461D7C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF461D7C),
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF461D7C),
                    fontFamily: 'Proxima Nova',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: 'Proxima Nova',
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
