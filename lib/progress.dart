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
                    color: completed ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(location, style: const TextStyle(fontSize: 16)),
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
        title: Center(
          child: const Text(
            'Your Progress',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
      body: Column(
        children: [Column(
          children: [
            Text("You've completed $_sampleString% of the scavenger hunt"),
            _buildProgressSection(progress),
          ],
        )],
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
