import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void createNote(){
    Navigator.pop(context, {
      'noteTitle': titleController.text,
      'noteContent': contentController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  createNote();
                }, 
                child: const Text(
                  'Создать',
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