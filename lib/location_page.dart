import 'package:flutter/material.dart';

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
    final riddles = {
      "1": {
        "Panera": "At Panera, where you love to stay, \nThe sign in front calls out my name. \nSteamed milk swirls in coffee's embrace, \nA creamy sip, a warm embrace. \n\nWhat drink am I? ☕",
        "Auditorium": "By glass doors in the hallway near,\nBehind Capstone stairs, it becomes clear.\nA purple sign beholds my name,\nSo all who see it may proclaim.\nThat to the creation of building I donated with pride,\nMy name is known in timber, far and wide.\n\nWhat Company I? 🌲",
        "Chevron Center": "In the heart of PFT, where innovation thrives,\nA center of learning where knowledge arrives.\nWith Chevron's name proudly displayed,\nWhere students and faculty have stayed.\nWhat is this place where ideas flow free?\nThe Chevron Center, where minds can be.\n\nWhat is the room number of the Chevron Center?",
        "Placeholder 2": "Placeholder riddle text",
      },
      "2": {
        "Student Gathering Space": "On the second floor with a staircase in rear\nall students in need may cometh here.\nI contain chairs and tables and sofas galore.\nBehind me is a glass wall where you can see much more.\n\nMy donator's name is on a plaque in front.\nHe goes by a nickname which may seem quite blunt.\n\nWhat is the nickname of the person who donated to me?",
        "Robots": "Behind a glass wall, where robots reside,\nOn the second floor, with others by his side.\nWith a yellow name, shining bright,\nA ramp in front, ready to fight.\n\nWho is this robot, standing so near?\nHis name is known to all who come here.\n\nWhat am I? 🤖",
        "Placeholder 3": "Placeholder riddle text",
        "Placeholder 4": "Placeholder riddle text",
      },
      "3": {
        "School of EE and CS": "On the third floor, where knowledge is king,\nA glass front office, many students it brings.\nHome to engineers and coders alike,\nBehind these walls, innovations strike.\n\nThe room's name, where brilliance does reside,\nIs the School of Electrical Engineering and Computer Science Office, where minds collide.\n\nWhat is my room number?",
        "Bayport Technical Center": "Behind a glass wall, I stand with pride,\nA mechanical tube, where fluids glide.\nOn the third floor, I do reside,\nWhere innovation and engineering collide.\n\nA plaque stands before me, with the name Bayport in line,\nThe last four of the phone number, a clue to define.\nCan you guess what these numbers might be,\nTo unlock the answer and set you free?\n\nWhat are the last four digits of the number you'll see?",
        "Placeholder 5": "Placeholder riddle text",
        "Placeholder 6": "Placeholder riddle text",
      },
    };

    return riddles[widget.level]?[widget.locationName] ?? 'Riddle not found';
  }

  void _checkAnswer() {
    final answers = {
      "1": {
        "Panera": "Latte",
        "Auditorium": "RoyOMartin",
        "Chevron Center": "1101",
        "Placeholder 2": "Placeholder",
      },
      "2": {
        "Student Gathering Space": "Bill",
        "Robots": "Toby",
        "Placeholder 3": "Placeholder",
        "Placeholder 4": "Placeholder",
      },
      "3": {
        "School of EE and CS": "3325",
        "Bayport Technical Center": "1229",
        "Placeholder 5": "Placeholder",
        "Placeholder 6": "Placeholder",
      },
    };

    String? correctAnswer = answers[widget.level]?[widget.locationName];
    if (_answerController.text.trim().toLowerCase() ==
        correctAnswer?.toLowerCase()) {
      setState(() {
        _feedback = 'Correct! 🎉';
        _isCorrect = true;
        _showFunFact = true;
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
                        color: Colors.black87,
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
                onSubmitted: (_) => _checkAnswer(),
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
                        'Fun fact not available',
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