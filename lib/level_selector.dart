import 'package:flutter/material.dart';
import 'main.dart';
import 'progress.dart';

class LevelSelector extends StatefulWidget {
  const LevelSelector({super.key});

  @override
  _LevelSelectorState createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  int _selectedIndex = 1; // Default to "Levels" being selected
  String levelOne = "1";
  String levelTwo = "2";
  String levelThree = "3";

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

  Widget _buildLevelCard(String level, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.blueAccent),
        title: Text('Explore Level $level',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Pick a location on level $level'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Location 1 on Level $level"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Location 2 on Level $level"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Location 3 on Level $level"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Location 4 on Level $level"),
                  ),
                ],
              ),
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
        backgroundColor: Color(0xFF461D7C),
        title: const Text(
          'Maybe LSU logo will go here',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Column(
        children: [
          _buildLevelCard("1", Icons.check),
          _buildLevelCard("2", Icons.check),
          _buildLevelCard("3", Icons.check),
        ],
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
