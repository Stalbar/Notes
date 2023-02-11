import 'package:flutter/material.dart';
import 'package:notes/services/Note.dart';
import 'package:notes/services/storage.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.storage});

  final NotesStorage storage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    widget.storage.readNotes().then((value) => {
      setState(() {
        notes = value;
      })
    });
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                    ),
                    fillColor: Colors.grey[300],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Поиск заметок',
                  ),
                )),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    String searchText = searchController.text;
                    return searchText == '' || notes[index].noteContent.contains(searchText) || notes[index].noteTitle.contains(searchText) ? Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ListTile(
                        onTap: () async {
                          dynamic result = await Navigator.pushNamed(context, '/edit', arguments: {
                            'noteTitle': notes[index].noteTitle,
                            'noteContent': notes[index].noteContent,
                          });
                          if (result == null) {
                            return;
                          } 
                          setState(() {
                            notes[index].noteTitle = result['noteTitle'];
                            notes[index].noteContent = result['noteContent'];
                          });

                          widget.storage.writeNotes(notes);
                        },
                        title: Text(
                          notes[index].noteTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          notes[index].noteContent,
                          style: const TextStyle(
                            fontSize: 14,
                          ), 
                        ),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            setState((){
                              notes.remove(notes[index]);
                            });
                            widget.storage.writeNotes(notes);
                          },
                      ),
                    ),
                  ) : Container();
                }
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/add');
            if (result == null) {
              return;
            }
            Note newNote = Note(noteTitle: result['noteTitle'], noteContent: result['noteContent']);
            setState(() {
              notes.add(newNote);
            });

            widget.storage.writeNotes(notes);
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
