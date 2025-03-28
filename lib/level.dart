import 'package:flutter/material.dart';
import 'location_page.dart';

class LevelPage extends StatelessWidget {
  final String level;

  const LevelPage({Key? key, required this.level}) : super(key: key);

  List<String> _getLocations() {
    final locationsByLevel = {
      "1": ["Panera", "Auditorium", "Chevron Center", "Placeholder 2"],
      "2": ["Student Gathering Space", "Robots", "Placeholder 3", "Placeholder 4"],
      "3": ["School of EE and CS", "Bayport Technical Center", "Placeholder 5", "Placeholder 6"],
    };

    return locationsByLevel[level] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final locations = _getLocations();
    final locationStatus = <String, bool>{}; // Placeholder for location status

    print('Building UI with locations: $locations');
    print('Location status: $locationStatus');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF461D7C),
        title: Text(
          'Explore Level $level',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Proxima Nova',
          ),
        ),
      ),
      backgroundColor: const Color(0xFF461D7C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              ...locations.map((location) {
                final isDone = locationStatus[location] ?? false;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPage(
                            level: level,
                            locationName: location,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDone ? Colors.green : const Color(0xFFFDD023),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Proxima Nova',
                          ),
                        ),
                        if (isDone) ...[
                          const SizedBox(width: 8),
                          const Icon(Icons.check_circle, color: Colors.black),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
