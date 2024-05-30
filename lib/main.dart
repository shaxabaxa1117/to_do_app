import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/domain/database/notes_data.dart';
import 'package:to_do_app/todo_app.dart';




Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(NotesDataAdapter()); 

  await Hive.openBox<NotesData>('note');//! стандарт для подключения HIVE




  runApp(ToDoApp());
}
