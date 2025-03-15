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
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      appBar: AppBar(
        backgroundColor: Color(0xFF461D7C),
        title: const Text(
          'Maybe LSU logo will go here',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
      backgroundColor: Color(0xFF461D7C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFFFDD023),
        unselectedItemColor: Color(0xFF461D7C),
        currentIndex: _selectedIndex, // Highlight selected tab
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
