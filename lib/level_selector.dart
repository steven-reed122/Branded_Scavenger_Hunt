import 'package:flutter/material.dart';
import 'main.dart';
import 'progress.dart';
import 'level.dart';

class LevelSelector extends StatefulWidget {
  const LevelSelector({super.key});

  @override
  _LevelSelectorState createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  int _selectedIndex = 1; // Default to "Levels" being selected

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary reloads

    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page')),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProgressPage()),
      );
    }
    // For index 1 (levels), we don't need to navigate since we're already on LevelSelector
  }

  Widget _buildLevelCard(String level, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, size: 36, color: const Color(0xFF461D7C)),
        title: Text(
          'Explore Level $level',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF461D7C),
            fontFamily: 'Proxima Nova',
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF461D7C)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LevelPage(level: level),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF461D7C),
        toolbarHeight: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: 64, // Increase width to 1 inch
            height: 48, // Adjust height proportionally
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
          'Levels',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Proxima Nova',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF461D7C), // Set background to purple
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLevelCard("1", Icons.looks_one),
          const SizedBox(height: 8),
          _buildLevelCard("2", Icons.looks_two),
          const SizedBox(height: 8),
          _buildLevelCard("3", Icons.looks_3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFFFDD023),
        unselectedItemColor: const Color(0xFF461D7C),
        currentIndex: _selectedIndex,
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
}
