import 'package:flutter/material.dart';
import 'riddle_data.dart';
import 'location_page.dart';

class LevelPage extends StatefulWidget {
  final String level;
  const LevelPage({super.key, required this.level});

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  List<String> locations = [];

  @override
  void initState() {
    super.initState();
    updateLocations(); // Update when the page first loads
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateLocations(); // Called when dependencies change (such as when navigating back)
  }

  void updateLocations() {
    setState(() {
      locations = RiddleData.riddles[widget.level]
          ?.expand((entry) => entry)
          .map((map) => map.keys.first)
          .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDone = RiddleData.getLocationStatus();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF461D7C),
        title: Text(
          'Level ${widget.level}',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Proxima Nova',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPage(
                            level: widget.level,
                            locationName: location,
                          ),
                        ),
                      );
                      updateLocations(); // Update when coming back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDD023),
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Proxima Nova',
                          ),
                        ),
                        if (isDone[location] ?? false) ...[
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
