import 'package:flutter/material.dart';

class RiddleData {
  static final Map<String, List<List<Map<String, List<dynamic>>>>> riddles = {
    "1": [
      [
        {
          "Panera": [
            """At Panera, where you love to stay, 
The sign in front calls out my name. 
Steamed milk swirls in coffee's embrace, 
A creamy sip, a warm embrace. 

What drink am I? ☕""",
            "Latte",
            'They serve over a thousand students every day!',
            false,
          ]
        }
      ],
      [
        {
          "Auditorium": [
            """By glass doors in the hallway near,
Behind Capstone stairs, it becomes clear.
A purple sign beholds my name,
So all who see it may proclaim.
That to the creation of building I donated with pride,
My name is known in timber, far and wide.

What Company I? 🌲""",
            "RoyOMartin",
            'RoyOMartin is one of the most successful manufacturers of wood products in the South!',
            false,
          ]
        }
      ],
      [
        {
          "Chevron Center": [
            """In the heart of PFT, where innovation thrives,
A center of learning where knowledge arrives.
With Chevron's name proudly displayed,
Where students and faculty have stayed.
What is this place where ideas flow free?
The Chevron Center, where minds can be.

What is my room number?""",
            "1269",
            'The Chevron Center is also known as the Center for Engineering Education!',
            false,
          ]
        }
      ],
      [
        {
          "Grand Stairs": [
            """Near the Chevron Center, I stand so grand,
A staircase of beauty, both wide and planned.
With platforms that offer a place to rest,
A meeting spot where students are blessed.
Count my platforms, if you dare,
The number you find will be quite fair.

How many platforms are there?""",
            "Two",
            'Many students use these stairs to read and study daily!',
            false,
          ]
        }
      ],
    ],
    "2": [
      [
        {
          "Student Gathering Space": [
            """On the second floor with a staircase in rear
all students in need may cometh here.
I contain chairs and tables and sofas galore.
Behind me is a glass wall where you can see much more.

My donator's name is on a plaque in front.
He goes by a nickname which may seem quite blunt.

What is the nickname of the person who donated to me?""",
            "Bill",
            'This is one of the most popular spots for students to rest between classes and study with friends.',
            false,
          ]
        }
      ],
      [
        {
          "Robots": [
            """Behind a glass wall, where robots reside,
On the second floor, with others by his side.
With a yellow name, shining bright,
A ramp in front, ready to fight.

Who is this robot, standing so near?
His name is known to all who come here.

What am I? 🤖""",
            "Toby",
            'Every year Bengal Bots, a club that offers experience with different types of robots, hosts a battlebots event at PFT!',
            false,
          ]
        }
      ],
      [
        {
          "Placeholder 1": [
            """Placeholder""",
            "Placeholder",
            'They serve over a thousand students every day!',
            false,
          ]
        }
      ],
      [
        {
          "Placeholder 2": [
            """Placeholder""",
            "Placeholder",
            'They serve over a thousand students every day!',
            false,
          ]
        }
      ],
    ],
    "3": [
      [
        {
          "School of EE and CS": [
            """On the third floor, where knowledge is king,
A glass front office, many students it brings.
Home to engineers and coders alike,
Behind these walls, innovations strike.

The room's name, where brilliance does reside,
Is the School of Electrical Engineering and Computer Science Office, where minds collide.

What is my room number?""",
            "3325",
            'This is where many students can come to learn more about what Computer Science and Electrical Engineering has to offer.',
            false,
          ]
        }
      ],
      [
        {
          "Bayport Technical Center": [
            """Behind a glass wall, I stand with pride,
A mechanical tube, where fluids glide.
On the third floor, I do reside,
Where innovation and engineering collide.

A plaque stands before me, with the name Bayport in line,
The last four of the phone number, a clue to define.
Can you guess what these numbers might be,
To unlock the answer and set you free?

What are the last four digits of the number you'll see?""",
            "1229",
            'A multi-pass floating head can allow for fluids to pass through the tubes multiple times, increasing the heat transfer efficiency!',
            false,
          ]
        }
      ],
      [
        {
          "Placeholder 1": [
            """Placeholder""",
            "Placeholder",
            'They serve over a thousand students every day!',
            false,
          ]
        }
      ],
      [
        {
          "Placeholder 2": [
            """Placeholder""",
            "Placeholder",
            'They serve over a thousand students every day!',
            false,
          ]
        }
      ],
    ],
  };

  static String getFunFact(String level, String locationName) {
    final levelRiddles = riddles[level];

    if (levelRiddles != null) {
      for (final entry in levelRiddles) {
        for (final riddle in entry) {
          if (riddle.containsKey(locationName)) {
            return riddle[locationName]![2];  // Fun fact is the third element
          }
        }
      }
    }
    return 'Fun fact not found';
  }

  // Function to get a Map of locations and their progress status
  static Map<String, bool> getLocationStatus() {
    Map<String, bool> locationStatus = {};

    // Iterate through each category in the riddles map
    riddles.forEach((level, levelRiddles) {
      for (final riddleGroup in levelRiddles) {
        for (final riddle in riddleGroup) {
          // Extract the location name and its progress status
          riddle.forEach((location, details) {
            locationStatus[location] = details[3]; // The progress status is the 4th element
          });
        }
      }
    });
    print(locationStatus);
    return locationStatus;
  }

  static void markLocationDone(String floor, String locationName) {
    final levelRiddles = riddles[floor];

    if (levelRiddles != null) {
      for (final entry in levelRiddles) {
        for (final riddle in entry) {
          if (riddle.containsKey(locationName)) {
            riddle[locationName]![3] = true; // Update status to true
            return;
          }
        }
      }
    }
  }
}