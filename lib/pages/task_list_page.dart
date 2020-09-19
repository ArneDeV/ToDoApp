import 'package:flutter/material.dart';

import 'package:todo_v2/widgets/task_card.dart';

class TaskListPage extends StatelessWidget {
  static const routeName = '/taken';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Taken',
                style: TextStyle(fontSize: 38),
              ),
            ),
            TaskCard(
              title: 'Universiteit',
              desc: 'Taken en planning die verband houden met studies aan de universiteit.',
              color: Colors.orange[400],
            ),
            TaskCard(
              title: 'Scouts',
              desc: 'Taken gerelateerd aan scouts, bijvoorbeeld zaken die ik niet mag vergeten.',
              color: Colors.red[600],
            ),
            TaskCard(),
          ],
        ),
      ),
    );
  }
}
