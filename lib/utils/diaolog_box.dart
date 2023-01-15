import 'package:flutter/material.dart';

import 'package:ingilizcego/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController wordController;
  final TextEditingController meaningController;

  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    Key? key,
    required this.wordController,
    required this.meaningController,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: wordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Kelime[EN] ",
              ),
            ),

            TextField(
              controller: meaningController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Anlamı[TR]",
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(onPressed: onSave, text: "Save"),
                const SizedBox(
                  width: 4,
                ),
                //cancel button
                MyButton(onPressed: onCancel, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
