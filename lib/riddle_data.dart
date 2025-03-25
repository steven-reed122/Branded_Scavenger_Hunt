import 'package:flutter/material.dart';

class RiddleData {

  static final Map<String, List<List<Map<String, List<String>>>>> riddles = {
    "1": [
      [
        {
          "Panera": [
            """At Panera, where you love to stay, 
The sign in front calls out my name. 
Steamed milk swirls in coffee's embrace, 
A creamy sip, a warm embrace. 

What drink am I? ☕""",
            "Latte"
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
            "RoyOMartin"
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
            "Bill"
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
            "Toby"
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
            "3325"
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
            "1229"
          ]
        }
      ],
    ],
  };


  static final Map<String, String> funFacts = {
    '1st Story - Panera':
        'Fun Fact: They serve over a thousand students every day!',
    '1st Story - Auditorium':
        'Fun Fact: RoyOMartin is one of the most successful manufacturers of wood products in the South!',
    '2nd Story - Student Gathering Space':
        'Fun Fact: This is one of the most popular spots for students to rest between classes and study with friends.',
    '2nd Story - Robots':
        'Every year Bengal Bots, a club that offers experience with different types of robots, hosts a battlebots event at PFT!',
    '3rd Story - School of EE and CS':
        'Fun fact: This is where many students can come to learn more about what Computer Science and Electrical Engineering has to offer.',
    '3rd Story - Bayport Technical Center':
        'Fun Fact: A multi-pass floating head can allow for fluids to pass through the tubes multiple times, increasing the heat transfer efficiency!',
  };
}