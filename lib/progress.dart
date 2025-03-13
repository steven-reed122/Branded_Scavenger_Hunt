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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Progress Page")],
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
