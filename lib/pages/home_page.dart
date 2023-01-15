import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ingilizcego/data/database.dart';
import 'package:ingilizcego/utils/diaolog_box.dart';
import 'package:ingilizcego/utils/word_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Reference box
  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();
  //Text contoller
  final _wordController = TextEditingController();
  final _meaningController = TextEditingController();

  @override
  void initState() {
    // if this is 1st time ever openin the app, then create data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //Checkbox was tapped
  checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updataDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_wordController.text, _meaningController.text, false]);
      _wordController.clear();
      _meaningController.clear();
    });

    Navigator.of(context).pop();
    db.updataDataBase();
  }

  //Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          wordController: _wordController,
          meaningController: _meaningController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          "İ N G İ L İ Z C E G O ",
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return WordTile(
            word: db.toDoList[index][0],
            meaning: db.toDoList[index][1],
            wordCompleted: db.toDoList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
