import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  String? name = "";

// reference out box
  final _myBox = Hive.box("mybox");

  void nameSave() {
    _myBox.put("ADSOYAD", name);
  }

  void createInitialData() {
    toDoList = [
      ["Make", "Yapmak", false],
      ["Exercise", "Egzersiz", false],
    ];
  }

  //load the data from data base

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

//updata the database
  void updataDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
