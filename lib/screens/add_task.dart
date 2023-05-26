import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
     String newTaskTitle = '';
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextFormField(
            validator: (value) {
              if(value!.isEmpty)
                return 'This field must not be empty' ;

                return null ;

            },
            onChanged: (newValue) {
              newTaskTitle = newValue;
            //  print(newTaskTitle);
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              // print('the value is $newTaskTitle');
             if(formKey.currentState!.validate())
               {

                 Provider.of<TaskData>(context, listen: false ).addTask(newTaskTitle);
                 Navigator.pop(context);
                 print('Task with title $newTaskTitle has been added successfully ');
               }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
