import 'package:flutter/material.dart';
import 'package:sign_in_up/db/notes_database.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final noteController = TextEditingController();
  final notesdb = NotesDatabase();
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Notes"),
        content: TextField(controller: noteController),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () async {
              try {
                final newnote = noteController.text;
                await notesdb.createtable(newnote);
              } catch (e) {}
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
