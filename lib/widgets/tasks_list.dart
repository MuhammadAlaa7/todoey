import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData data, Widget? child) {
        // here you wrap the widget that needs to be updated when there a change in the state
        // so you need to listen ( consume ) to the class that holds the state >>>> TaskData
        // the second parameter ( data ) its from data type TaskData because this is the data you need to get from TaskData
        // instead of write >> Provider.of<TaskData>(context) you just write >> data
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
            taskTitle: data.tasks[index].title,
            task: data.tasks[index],
            index: index,
          ),
          itemCount: data.tasks.length,
        );
      },
    );
  }
}
