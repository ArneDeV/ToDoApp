import 'package:flutter/material.dart';

import './page_switcher.dart';

import './pages/task_list_page.dart';
import './pages/vandaag_page.dart';
import './pages/belangrijk_page.dart';
import './pages/stats_page.dart';

void main() => runApp(MyApp());

const PRIMARY = "primary";
const SECONDARY = "secondary";
const UNSELECTED = "unselected";

Map myColors = {
  PRIMARY: Color.fromRGBO(75, 119, 242, 1),
  SECONDARY: Colors.grey.shade300,
  UNSELECTED: Colors.black54,
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: myColors[PRIMARY],
        textTheme: TextTheme(
          headline2: TextStyle(fontSize: 40),
        ),
      ),
      //* Navigator voor bottom nav bar
      routes: {
        TaskListPage.routeName: (context) => TaskListPage(),
        VandaagPage.routeName: (context) => VandaagPage(),
        BelangrijkPage.routeName: (context) => BelangrijkPage(),
        StatsPage.routeName: (context) => StatsPage(),
      },
      home: PageSwitcher(),
    );
  }
}
