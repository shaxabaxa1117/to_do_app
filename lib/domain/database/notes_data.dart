import 'package:hive/hive.dart';

part 'notes_data.g.dart';




//!Model

@HiveType(typeId: 0)
class NotesData {

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? text; 

  @HiveField(2)
  bool isChecked;

  NotesData({
    this.title,
    this.text,
    this.isChecked = false,
  });


}
