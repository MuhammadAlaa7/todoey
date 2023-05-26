import 'dart:collection';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Eat'),
  ];

  int get tasksCount {
    return _tasks.length;
  }

  // here you are making unmodified version of the list tasks to just read from it not to modify it >>> it is a getter but for lists
  // and if you tried to modify it it will throw a run time error saying you can not modify it
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  bool isChecked = false;


  void updateTask(Task task) {
    task.toggleCheckBox();
    notifyListeners();
  }


  void addTask(String newTaskTitle) {
    _tasks.add(
      Task(
        title: newTaskTitle,
      ),
    );
    notifyListeners();
  }


  Task removedTask = Task(title: '');

  void removeTask(int index) {
    removedTask = _tasks.removeAt(index);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Task removed'),
    //     action: SnackBarAction(
    //       label: 'Undo',
    //       onPressed: () {
    //         _addTask(removedTask, index);
    //       },
    //     ),
    //   ),
    //   );
    notifyListeners();
  }

  void addTask2(Task task, int index) {
    _tasks.insert(index, task);
    notifyListeners();
  }


// void removeTask(int index){
// _tasks.removeAt( index );
// notifyListeners();

// }
// void insertRemoved (Task task , int index ){
//   _tasks.insert(index, task);
//   notifyListeners();
// }

// void addRemovedTask(int index, String newTaskTitle) {
//   _tasks.insert(
//     index,
//     Task(
//       title: newTaskTitle,
//     ),
//   );
//   notifyListeners();
// }


}