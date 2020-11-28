import 'package:flutter/material.dart';

import '../database_helper.dart';
import '../main.dart';
import '../models/task.dart';
import '../widgets/todo.dart';

class TaskPage extends StatefulWidget {
  final Task task;

  TaskPage({@required this.task});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DataBaseHelper _dbhelper = DataBaseHelper();

  int _taskId = 0;
  String _title = "";
  String _desc = "";
  bool _visible = false;
  String _color = "blue";

  FocusNode _titleFocus;
  FocusNode _descFocus;
  FocusNode _todoFocus;

  List<String> _kleurOpties = [
    'Blauw',
    'Oranje',
    'Rood',
    'Groen',
  ];

  @override
  void initState() {
    // print("ID: ${widget.task.id}"); Geeft error !
    if (widget.task != null) {
      _title = widget.task.title;
      _taskId = widget.task.id;
      _desc = widget.task.desc;
      _color = widget.task.color;

      _visible = true;
    }

    _titleFocus = FocusNode();
    _descFocus = FocusNode();
    _todoFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descFocus.dispose();
    _todoFocus.dispose();

    super.dispose();
  }

  void handleChoice(String value) async {
    if (value == 'delete') {
      await _dbhelper.removeTask(_taskId, context);
    } else {
      await _dbhelper.updateTaskColor(_taskId, value);
      setState(() {
        print(value);
        _color = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[SECONDARY],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 16.0, bottom: 4.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: getColor(_color),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    // ! Title field
                    child: TextField(
                      focusNode: _titleFocus,
                      onSubmitted: (value) async {
                        // Check of het veld niet leeg is
                        if (value != '') {
                          // Kijk of task al bestaat
                          if (widget.task == null) {
                            Task _newTask = Task(title: value, color: 'blue');
                            _taskId = await _dbhelper.insertTask(_newTask);
                            print("New task has been added");
                            setState(() {
                              _visible = true;
                              _title = value;
                            });
                          }
                          // Indien al bestaat => Update data
                          else {
                            await _dbhelper.updateTaskTitle(_taskId, value);
                          }

                          _descFocus.requestFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Titel van de Taak',
                      ),
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      controller: TextEditingController()..text = _title,
                    ),
                  ),
                  Visibility(
                    visible: _visible,
                    child: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: getColor(_color),
                        size: 32,
                      ),
                      onSelected: handleChoice,
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: _kleurOpties[0].toLowerCase(),
                          child: Text(_kleurOpties[0]),
                        ),
                        PopupMenuItem<String>(
                          value: _kleurOpties[1].toLowerCase(),
                          child: Text(_kleurOpties[1]),
                        ),
                        PopupMenuItem<String>(
                          value: _kleurOpties[2].toLowerCase(),
                          child: Text(_kleurOpties[2]),
                        ),
                        PopupMenuItem<String>(
                          value: _kleurOpties[3].toLowerCase(),
                          child: Text(_kleurOpties[3]),
                        ),
                        PopupMenuDivider(),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            'Verwijder taak',
                            style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _visible,
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: null,
                focusNode: _descFocus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Geef de beschrijving voor de taak...',
                  contentPadding: EdgeInsets.only(left: 28.0, right: 28.0, bottom: 10.0),
                ),
                onSubmitted: (value) {
                  if (value != '') {
                    if (_taskId != 0) {
                      _dbhelper.updateTaskDesc(_taskId, value);
                      _desc = value;
                      setState(() {});
                    }
                  }
                  _todoFocus.requestFocus();
                },
                controller: TextEditingController()..text = _desc,
              ),
            ),
            Visibility(
              visible: _visible,
              child: FutureBuilder(
                initialData: [],
                future: _dbhelper.getTodos(_taskId),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (snapshot.data[index].isDone == 0) {
                              _dbhelper.updateTodo(snapshot.data[index].id, 1);
                            } else {
                              _dbhelper.updateTodo(snapshot.data[index].id, 0);
                            }
                            setState(() {});
                          },
                          child: TodoWidget(
                            text: snapshot.data[index].title,
                            isDone: snapshot.data[index].isDone == 0 ? false : true,
                            color: getColor(_color),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            // ! Add task Widget
            Visibility(
              visible: _visible,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 29, right: 12),
                    child: Icon(
                      Icons.playlist_add,
                      color: getColor(_color),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController()..text = '',
                      focusNode: _todoFocus,
                      onSubmitted: (value) async {
                        // Check if not empty
                        if (value != "") {
                          if (_taskId != 0) {
                            Todo _newTodo = Todo(
                              title: value,
                              isDone: 0,
                              taskId: _taskId,
                            );

                            await _dbhelper.insertTodo(_newTodo);
                            setState(() {});
                          }
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Voeg nieuwe taak toe!',
                      ),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
