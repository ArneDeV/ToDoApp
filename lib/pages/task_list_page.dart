import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  static const routeName = '/taken';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Taken pagina (0)',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
