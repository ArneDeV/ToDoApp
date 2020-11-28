import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database_helper.dart';
import '../main.dart';
import '../states/navBarProvider.dart';
import '../widgets/task_card.dart';
import 'task_page.dart';

class TaskListPage extends StatefulWidget {
  static const routeName = '/taken';

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  DataBaseHelper _dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
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
            Expanded(
              // ! Toon alle taken
              child: Consumer<BotNavBarProvider>(
                builder: (ctx, state, _) {
                  return FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTasks(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // print("Pressed a task");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TaskPage(task: snapshot.data[index]),
                                ),
                              ).then(
                                (value) {
                                  setState(() {});
                                },
                              );
                            },
                            child: TaskCard(
                              title: snapshot.data[index].title,
                              desc: snapshot.data[index].desc,
                              color: getColor(snapshot.data[index].color),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
