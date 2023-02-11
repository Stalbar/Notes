import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void editNote() {
    Navigator.pop(context, {
      'noteTitle': titleController.text,
      'noteContent': contentController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    titleController.text = data['noteTitle'];
    contentController.text = data['noteContent'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body:  Column(
          children: [
             Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: TextField(
                controller: titleController,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Заголовок',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 18,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  hintText: 'Начните ввод',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  editNote();
                }, 
                child: const Text(
                  'Изменить',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}