import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/domain/database/hive_box.dart';
import 'package:to_do_app/domain/database/notes_data.dart';

class SearchProvider extends ChangeNotifier {



  SearchProvider(){
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
  }



  final _notes = HiveBox.notes.values.toList(); // лист
  var filteredNotes = <NotesData>[];
  final searchController = TextEditingController();

  void _searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where((note) {
        return note.title!.toLowerCase().contains(query.toLowerCase());//! title! - shows that that won't be null
      }).toList();
    } else{
      filteredNotes = _notes;
    }
    notifyListeners();
  }
}
