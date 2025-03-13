import 'package:flutter/material.dart';
import 'level.dart';
//import 'location_page.dart';

class LevelPage extends StatelessWidget {
  final String level;
  const LevelPage({super.key, required this.level});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF461D7C),
      appBar: AppBar(
        title: Text('Level $level'),
        backgroundColor: Color(0xFF461D7C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ✅ This is the newly styled text box for "Explore Level $level"
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.6), // Semi-transparent black box
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explore Level $level',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
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

              const SizedBox(height: 20),

              /// ✅ Location 1 Button
              ElevatedButton(
                onPressed: () { /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          LocationPage(level: level, locationNumber: 1),
                    ),
                  );*/
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFDD023),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(180, 50),
                ),
                child: const Text('Location 1'),
              ),

              const SizedBox(height: 12),

              /// ✅ Location 2 Button
              ElevatedButton(
                onPressed: () { /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          LocationPage(level: level, locationNumber: 2),
                    ),
                  ); */
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFDD023),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(180, 50),
                ),
                child: const Text('Location 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
