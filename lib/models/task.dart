class Task {
  final int id;
  final String title;
  final String desc;

  // Todo: Add color to db
  final String color;

  Task({this.id, this.title, this.desc, this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'color': color,
    };
  }
}

class Todo {
  final int id;
  final int taskId;
  final String title;
  final int isDone;

  Todo({this.id, this.title, this.isDone, this.taskId});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "isDone": isDone,
      "taskId": taskId,
    };
  }
}
