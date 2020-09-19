import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/task_list_page.dart';
import '../pages/vandaag_page.dart';
import '../pages/belangrijk_page.dart';
import '../pages/stats_page.dart';

class BotNavBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  List<Widget> pages = [
    TaskListPage(),
    VandaagPage(),
    BelangrijkPage(),
    StatsPage(),
  ];

  Widget get currentPage {
    return pages[_selectedIndex];
  }

  int get currentIndex {
    return _selectedIndex;
  }

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
