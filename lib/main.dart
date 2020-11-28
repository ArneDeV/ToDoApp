import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page_switcher.dart';

void main() => runApp(MyApp());

const PRIMARY = "primary";
const SECONDARY = "secondary";
const UNSELECTED = "unselected";
const ORANGE = 'orange';
const RED = 'red';
const GREEN = 'green';

Color getColor(String color) {
  if (color == 'oranje') {
    return myColors[ORANGE];
  } else if (color == 'rood') {
    return myColors[RED];
  } else if (color == 'groen') {
    return myColors[GREEN];
  } else {
    return myColors[PRIMARY];
  }
}

Map myColors = {
  PRIMARY: Color.fromRGBO(75, 119, 242, 1),
  SECONDARY: Colors.grey.shade300,
  ORANGE: Colors.orange[500],
  UNSELECTED: Colors.black54,
  RED: Colors.red[800],
  GREEN: Colors.green[800],
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: myColors[PRIMARY],
        textTheme: GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
      ),
      home: PageSwitcher(),
    );
  }
}
