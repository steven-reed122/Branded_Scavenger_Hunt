import 'package:flutter/material.dart';
import 'riddle_data.dart';

class LocationPage extends StatefulWidget {
  final String level;
  final String locationName;

  const LocationPage({
    Key? key,
    required this.level,
    required this.locationName,
  }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _answerController = TextEditingController();
  String? _feedback;
  bool _isCorrect = false;
  bool _showFunFact = false;

  String get _riddleText {
    // Find the level in the riddles map
    final levelRiddles = RiddleData.riddles[widget.level];

    // If the level exists, proceed to find the location
    if (levelRiddles != null) {
      for (final entry in levelRiddles) {
        for (final riddle in entry) {
          if (riddle.containsKey(widget.locationName)) {
            // Return the riddle text for the location
            return riddle[widget.locationName]?[0] ?? 'Riddle not found';
          }
        }
      }
    }

    // Return an appropriate message if the riddle is not found
    return 'Riddle not found for the location $widget.locationName at level $widget.level';
  }

  void _checkAnswer() {
    String? correctAnswer = RiddleData.riddles[widget.level]
        ?.expand((entry) => entry) // Flatten the inner lists
        .firstWhere(
            (map) => map.containsKey(widget.locationName),
        orElse: () => {})[widget.locationName]![1];
    print("Answer");
    print(correctAnswer);
    if (_answerController.text.trim().toLowerCase() ==
        correctAnswer?.toLowerCase()) {
      setState(() {
        _feedback = 'Correct! 🎉';
        _isCorrect = true;
        _showFunFact = true;
        RiddleData.markLocationDone(widget.level, widget.locationName);
      });
    } else {
      setState(() {
        _feedback = 'Try again! 🤔';
        _isCorrect = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF461D7C),
        title: Text(
          widget.locationName,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Proxima Nova',
          ),
        ),
      ),
      backgroundColor: const Color(0xFF461D7C),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Riddle Card
            Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Riddle',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF461D7C),
                        fontFamily: 'Proxima Nova',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _riddleText,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontFamily: 'Proxima Nova',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Answer Input
            if (!_isCorrect) ...[
              TextField(
                controller: _answerController,
                decoration: InputDecoration(
                  hintText: 'Enter your answer',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Proxima Nova',
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Proxima Nova',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDD023),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Submit Answer',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Proxima Nova',
                  ),
                ),
              ),
            ],

            // Feedback
            if (_feedback != null) ...[
              const SizedBox(height: 16),
              Text(
                _feedback!,
                style: TextStyle(
                  fontSize: 20,
                  color: _isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Proxima Nova',
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // Fun Fact
            if (_showFunFact) ...[
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                color: const Color(0xFFFDD023),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        '🎓 Fun Fact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Proxima Nova',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        RiddleData.getFunFact(widget.level, widget.locationName),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontFamily: 'Proxima Nova',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDD023),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Return to Locations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF461D7C),
                    fontFamily: 'Proxima Nova',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
} 