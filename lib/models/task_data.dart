import 'package:flutter/cupertino.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{
  final List<Task> tasks = [
    Task(
      title: 'Task 1',
    ),
    Task(
      title: 'Task 2',
    ),
    Task(title: 'Task 3'),
  ];

   bool isChecked = false ;

  void toggleBox(value){
            isChecked = value ;
            print('here is the isChecked state: $isChecked');
            notifyListeners();

  }

}