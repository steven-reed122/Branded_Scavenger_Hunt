import 'package:flutter/material.dart';
import 'riddle_data.dart';
import 'location_page.dart';

class LevelPage extends StatelessWidget {
  final String level;
  const LevelPage({super.key, required this.level});

  @override
  Widget build(BuildContext context) {

    final locations = RiddleData.riddles[level]?.expand((entry) => entry).map((map) => map.keys.first).toList() ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      appBar: AppBar(
        title: Text(
          'Level $level',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Proxima Nova',
          ),
        ),
        backgroundColor: const Color(0xFF461D7C),
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
                    fontFamily: 'Proxima Nova',
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

              /// ✅ Location Buttons
              ...locations.map((locationName) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LocationPage(
                          level: level,
                          locationName: locationName,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFDD023),
                    foregroundColor: Colors.black,
                    minimumSize: const Size(180, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    locationName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
