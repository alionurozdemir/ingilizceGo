import 'package:flutter/material.dart';
import 'package:ingilizcego/data/database.dart';
import 'package:ingilizcego/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController textEditingController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  void nameSaveFunction() {
    db.name = textEditingController.text;
    db.nameSave();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: textEditingController,
        ),
        TextButton(
            onPressed: () {
              nameSaveFunction();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: const Text("İsmi Kaydet")),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: const Text("Devam Et"))
      ]),
    );
  }
}
