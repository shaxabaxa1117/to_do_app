import 'package:hive/hive.dart';
import 'package:to_do_app/domain/database/notes_data.dart';

abstract class HiveBox{

  static final notes = Hive.box<NotesData>('note');//! gets fata only for NoteData
}