import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WordTile extends StatelessWidget {
  final String word;
  final String meaning;
  final bool wordCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const WordTile(
      {super.key,
      required this.word,
      required this.meaning,
      required this.wordCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //Ceckbox
              Checkbox(
                value: wordCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //Task Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word,
                    style: TextStyle(
                        fontSize: 25,
                        decoration:
                            wordCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                  ),
                  Text(
                    meaning,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
