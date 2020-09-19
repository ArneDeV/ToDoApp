import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './main.dart';
import './widgets/navigation.dart';
import './states/navBarProvider.dart';

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
            appBar: AppBar(
              title: Text(
                'Arne\'s Taken',
                style: TextStyle(color: myColors[UNSELECTED]),
              ),
              elevation: 0,
              backgroundColor: myColors[SECONDARY],
              centerTitle: true,
            ),
            // ! Content van app
            body: state.currentPage,
            //* Add button voor todo
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () => print('Hello World'),
              child: Icon(Icons.add),
              elevation: 3,
            ),
          );
        },
      ),
    );
  }
}
