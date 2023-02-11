import 'package:flutter/material.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/pages/add_note.dart';
import 'package:notes/pages/edit_note.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/add': (context) => const AddNote(),
      '/edit': (context) => const EditNote(),  
    },
  ));
}
