class Task {
  String title;
  bool isDone;
  void toggleCheckBox() {
    isDone = !isDone;
  }

  Task({
    required this.title,
     this.isDone = false ,
  });
}
