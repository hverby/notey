import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/models/Note.dart';

class NoteProvider with ChangeNotifier{

  List<Note> _notes = [];

  void addNote(Note note){
    _notes.add(note);
    notifyListeners();
  }
  //UnmodifiableListView<Note> get allNotes => UnmodifiableListView(_notes);
  get allNotes => _notes;

  void deleteNote(DateTime dateTime){
    int index = _notes.indexWhere((element) => element.dateTime == dateTime);
    _notes.removeAt(index);
    //_notes.remove(_notes.firstWhere((element) => element.dateTime == dateTime));
    notifyListeners();
  }

  void updateNote(Note note){
    int index = _notes.indexWhere((element) => element.dateTime == note.dateTime);
    _notes[index] = note;
    notifyListeners();
  }
}