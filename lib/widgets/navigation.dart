import 'package:flutter/material.dart';

import '../pages/task_list_page.dart';
import '../pages/belangrijk_page.dart';
import '../pages/stats_page.dart';
import '../pages/vandaag_page.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  final Function callback;
  final int indexSelected;

  const BottomNavBar({Key key, this.callback, this.indexSelected}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color getColor(int index) {
    return widget.indexSelected == index ? myColors[PRIMARY] : myColors[UNSELECTED];
  }

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
              color: getColor(0),
            ),
            _NavItem(
              index: 1,
              icon: Icons.today,
              title: 'Vandaag',
              color: getColor(1),
            ),
            _SeperatorWidget(),
            _NavItem(
              index: 2,
              icon: Icons.star,
              title: 'Belangrijk',
              color: getColor(2),
            ),
            _NavItem(
              index: 3,
              icon: Icons.equalizer,
              title: 'Stats',
              color: getColor(3),
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
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        onTap: () {
          // _BottomNavBarState.setIndex(index);
          // switch (index) {
          //   case 0:
          //     Navigator.of(context).pushReplacementNamed(TaskListPage.routeName);
          //     break;
          //   case 1:
          //     Navigator.of(context).pushReplacementNamed(VandaagPage.routeName);
          //     break;
          //   case 2:
          //     Navigator.of(context).pushReplacementNamed(BelangrijkPage.routeName);
          //     break;
          //   case 3:
          //     Navigator.of(context).pushReplacementNamed(StatsPage.routeName);
          //     break;
          // }
        },
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
