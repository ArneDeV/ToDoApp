import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/navBarProvider.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: BottomAppBar(
        elevation: 1,
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              index: 0,
              icon: Icons.home,
              title: 'Taken',
            ),
            _NavItem(
              index: 1,
              icon: Icons.today,
              title: 'Vandaag',
            ),
            _SeperatorWidget(),
            _NavItem(
              index: 2,
              icon: Icons.star,
              title: 'Belangrijk',
            ),
            _NavItem(
              index: 3,
              icon: Icons.equalizer,
              title: 'Stats',
            )
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final int index;

  const _NavItem({Key key, this.icon, this.title, this.color, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<BotNavBarProvider>(
        builder: (ctx, state, _) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: state.currentIndex == index ? myColors[PRIMARY] : myColors[UNSELECTED],
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            onTap: () {
              state.changeIndex(index);
            },
          );
        }, // Builder
      ),
    );
  }
}

class _SeperatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 10,
        height: 60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
