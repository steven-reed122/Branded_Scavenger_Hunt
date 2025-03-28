import 'package:branded_scavenger_hunt/riddle_data.dart';
import 'package:flutter/material.dart';
import 'level.dart';
import 'main.dart';
import 'level_selector.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int _selectedIndex = 2;
  String _sampleString = "0";

  var progress = RiddleData.getLocationStatus();

  void textReturn(String value) {
    String text = "50";

    setState(() {
      _sampleString = text;
    });
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary reloads

    setState(() {
      _selectedIndex = index; // Update selected tab
    });

    Widget destination;
    if (index == 1) {
      destination = LevelSelector();
    } else if (index == 2) {
      destination = ProgressPage();
    } else {
      destination = MyHomePage(title: 'Flutter Demo Home Page');
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  Widget _buildProgressSection(Map<String, bool> progress) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Progress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...progress.keys.map((location) {
              final completed = progress[location] ?? false;
              return Row(
                children: [
                  Icon(
                    completed
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: Color(0xFF461D7C),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 18, // Increase font size
                      fontWeight: FontWeight.bold, // Make text bold
                      color: Color(0xFF461D7C),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
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
          'Your Progress',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Proxima Nova',
            fontSize: 28, // Increase font size
            fontWeight: FontWeight.bold, // Make text bold
          ),
          textAlign: TextAlign.center, // Center the text
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF461D7C), // Set background to purple
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "You've completed $_sampleString% of the scavenger hunt",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildProgressSection(progress), // Ensure this is included
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFFFDD023),
        unselectedItemColor: Color(0xFF461D7C),
        currentIndex: _selectedIndex, // Ensure the correct tab is highlighted
        onTap: _onItemTapped,
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
