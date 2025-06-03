class Task {
  static int taskCount = 0;
  int id;
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false}) : id = ++taskCount;

  void toggleDone() {
    isDone = !isDone;
  }

  void updateTitle(String newTitle) {
    title = newTitle;
  }

  // Convert Task to JSON Map
  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'isDone': isDone};

  // Create Task from JSON Map
  factory Task.fromJson(Map<String, dynamic> json) {
    final task = Task(title: json['title'], isDone: json['isDone']);
    task.id = json['id'];
    if (task.id > taskCount) {
      taskCount = task.id; // update static counter to prevent id duplication
    }
    return task;
  }
}
