
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/domain/database/hive_box.dart';
import 'package:to_do_app/domain/database/notes_data.dart';

class NotesProvider extends ChangeNotifier{

  // controllers
  
  final titleController = TextEditingController();
  final textController = TextEditingController();

  // add notes

//! View
  Future<void> addNote(BuildContext context) async{

    await HiveBox.notes.add(
      NotesData(
        title: titleController.text.isNotEmpty ? titleController.text : 'Title',
        text: textController.text.isNotEmpty ? textController.text : 'Not given',
      )
    ).then((value) => Navigator.pop(context)).then((value) => controllersClear());
  }


//* Deleting

  Future<void> deleteNote(int index) async{

    await HiveBox.notes.deleteAt(index);
  }

  // очищение контрллера
  controllersClear(){
    titleController.clear();
    textController.clear();
  }


  //* check note
  Future<void> onCheck(int index, List<NotesData> allNotes) async{
  await HiveBox.notes.putAt(index,
  NotesData(
  title: allNotes[index].title,//! changing the data entirly 
  text: allNotes[index].text,
  isChecked: !allNotes[index].isChecked

  ) );
  }

  //редактирование

    Future<void> onChange(BuildContext context, int index) async{

    await HiveBox.notes.putAt(index, NotesData(
      title: titleController.text,
      text: textController.text,

    )).then((value) => Navigator.pop(context));


}

//установка поле ввода значние при редактиировании 

  Future<void> setControllers(int index) async{
  titleController.text = HiveBox.notes.getAt(index)?.title ?? '';
  textController.text = HiveBox.notes.getAt(index)?.text ?? '';
  }

}