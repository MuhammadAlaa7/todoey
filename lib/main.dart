import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/*    >>>>>>>>>>>>>>> APP ILLUSTRATION <<<<<<<<<<<<<<<

*  first, you take the string from the text field in a variable string
* second, when pressing the button Add Task >> you send that variable with a function called addTask this function add an instance from Task class
 in the list tasks and its title is the value of that string variable.
* then,  the list view add a listTile which needs 3 things 1. title  2. checkbox status  3. on pressed to press the checkBox
*  listTile values comes from the model Task .

* */






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        home: TasksScreen(),

      ),
    );
  }
}
