import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/models/Note.dart';

class NoteProvider with ChangeNotifier{

  List<Note> _notes = [Note(title: "The standard Lorem Ipsum passage, used since the 1500s",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
      dateTime: DateTime.now(), color: Colors.black45)];

  void addNote(Note note){
    _notes.add(note);
    notifyListeners();
  }
  //UnmodifiableListView<Note> get allNotes => UnmodifiableListView(_notes);
  get allNotes => _notes;

  void deleteNote(DateTime dateTime){
    int index = _notes.indexWhere((element) => element.dateTime == dateTime);
    _notes.removeAt(index);
    notifyListeners();
  }

  void updateNote(Note note){
    int index = _notes.indexWhere((element) => element.dateTime == note.dateTime);
    _notes[index] = note;
    notifyListeners();
  }
}