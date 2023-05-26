import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final Task task;

  final int index;

  const TaskTile({
    required this.taskTitle,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        // Removing a task from the list
     //   Provider.of<TaskData>(context, listen: false).removeTask(index);
      Provider.of<TaskData>(context, listen: false).removeTask(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            content: Text("${taskTitle} has been deleted",
                style: TextStyle(color: Colors.white)),
            action: SnackBarAction(
              label: "UNDO",
              onPressed: () {
                //   list.insert(index, deleteItem); // this didn't work in my case
                Provider.of<TaskData>(context, listen: false).addTask2(
                  Provider.of<TaskData>(context).removedTask,
                  index,
                );
              },
            ),
          ),
        );
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (newValue) {
          Provider.of<TaskData>(context, listen: false).updateTask(task);
        },
      ),
    );
  }
}
