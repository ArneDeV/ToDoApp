import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/task_page.dart';
import 'states/navBarProvider.dart';
import 'widgets/navigation.dart';

class PageSwitcher extends StatefulWidget {
  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BotNavBarProvider(),
      child: Consumer<BotNavBarProvider>(
        builder: (contx, state, _) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            bottomNavigationBar: BottomNavBar(),
            // ! Content van app
            body: state.currentPage,
            //* Add button voor todo
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(task: null),
                  ),
                ).then((value) {
                  state.changeIndex(0);
                });
              },
              child: Icon(Icons.add),
              elevation: 3,
            ),
          );
        },
      ),
    );
  }
}
