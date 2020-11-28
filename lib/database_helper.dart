import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/task.dart';

class DataBaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, desc STRING, color STRING)");
        await db.execute(
            "CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");

        return db;
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await database();
    await _db
        .insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateTaskDesc(int id, String desc) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET desc = '$desc' WHERE id = '$id'");
  }

  Future<void> updateTaskColor(int id, String color) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks set color = '$color' WHERE id = '$id'");
  }

  Future<void> removeTask(int id, BuildContext context) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
    await _db.rawDelete("DELETE FROM todo WHERE taskId = '$id'");
    Navigator.pop(context);
  }

  Future<List<Task>> getTasks() async {
    Database _db = await database();

    List<Map<String, dynamic>> tasksMap = await _db.query('tasks');

    return List.generate(tasksMap.length, (index) {
      return Task(
        id: tasksMap[index]['id'],
        title: tasksMap[index]['title'],
        desc: tasksMap[index]['desc'],
        color: tasksMap[index]['color'],
      );
    });
  }

  Future<void> insertTodo(Todo todo) async {
    Database _db = await database();
    await _db.insert('todo', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodos(int taskId) async {
    Database _db = await database();

    List<Map<String, dynamic>> todoMap =
        await _db.rawQuery('SELECT * from todo WHERE taskId = $taskId');

    return List.generate(
      todoMap.length,
      (index) {
        return Todo(
            id: todoMap[index]['id'],
            title: todoMap[index]['title'],
            isDone: todoMap[index]['isDone']);
      },
    );
  }

  Future<void> updateTodo(int id, int isDone) async {
    Database _db = await database();
    _db.rawUpdate("UPDATE todo SET isDone = '$isDone' WHERE id = '$id'");
  }
}
