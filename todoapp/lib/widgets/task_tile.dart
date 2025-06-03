import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool taskCompleted;
  final ValueChanged<bool?>? checkboxCallback;
  final VoidCallback? longPressCallback;
  final VoidCallback? onDeletePress;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    this.checkboxCallback,
    this.longPressCallback,
    this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: taskCompleted,
        onChanged: checkboxCallback,
        activeColor: const Color.fromARGB(243, 27, 127, 227),
      ),
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 16,
          decoration: taskCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        onPressed: onDeletePress,
        icon: const Icon(Icons.delete),
        color: Colors.redAccent,
        tooltip: 'Delete Task',
      ),
    );
  }
}
