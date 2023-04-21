import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/models/Note.dart';

class UiProvider with ChangeNotifier{

  bool _isPaint = false;

  void toggle(){
    _isPaint = !_isPaint;
    notifyListeners();
  }
  //UnmodifiableListView<Note> get allNotes => UnmodifiableListView(_notes);
  get isPaint => _isPaint;
}