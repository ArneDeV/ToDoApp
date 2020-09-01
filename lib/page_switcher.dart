import 'package:flutter/material.dart';

import './widgets/navigation.dart';
import './main.dart';

import './pages/task_list_page.dart';
import './pages/vandaag_page.dart';
import './pages/belangrijk_page.dart';
import './pages/stats_page.dart';

class PageSwitcher extends StatefulWidget {
  final int currentPage;

  const PageSwitcher({Key key, this.currentPage}) : super(key: key);

  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  List<Widget> pages = [
    TaskListPage(),
    VandaagPage(),
    BelangrijkPage(),
    StatsPage(),
  ];

  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text('Arne\'s ToDo App'),
        elevation: 0,
        backgroundColor: myColors[PRIMARY],
        centerTitle: true,
      ),
      // ! Content van app
      body: pages[_currentIndex],
      //* Add button voor todo
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hello World'),
        child: Icon(Icons.add),
        elevation: 3,
      ),
    );
  }
}
