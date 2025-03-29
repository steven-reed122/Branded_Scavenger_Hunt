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
        primarySwatch: Colors.purple,
        fontFamily: 'Proxima Nova',
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

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120), // Increased height for larger logo
      child: AppBar(
        backgroundColor: const Color(0xFF461D7C),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 48), // Move logo down by half an inch
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 144, // Increased width (1.5 inches)
                  height: 96, // Keep height at 1 inch
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/LSU_logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading logo: $error');
                      return const Icon(
                        Icons.error_outline,
                        color: Color(0xFF461D7C),
                        size: 48,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        title: const Text(
          '',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Proxima Nova',
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color(0xFF461D7C),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Main Title
            const Text(
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
            const SizedBox(height: 40),
            // Feature Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFeatureCard(
                    icon: Icons.map,
                    title: 'Explore PFT',
                    description: 'Discover different locations and solve riddles throughout the building',
                  ),
                  const SizedBox(height: 10),
                  _buildFeatureCard(
                    icon: Icons.quiz,
                    title: 'Solve Riddles',
                    description: 'Test your knowledge with fun and challenging riddles',
                  ),
                  const SizedBox(height: 10),
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFFFDD023),
        unselectedItemColor: const Color(0xFF461D7C),
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

  Widget _buildFeatureCard({required IconData icon, required String title, required String description}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Color(0xFF461D7C)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}