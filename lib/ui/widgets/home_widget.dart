import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/domain/database/hive_box.dart';
import 'package:to_do_app/domain/database/notes_data.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return ValueListenableBuilder(

      valueListenable: HiveBox.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {

        final allNotes = notes.values.toList(); //! allnotes нигде не определен как list но там ХРНАТЬСЯ ДАННЫЕ<NotesData> КАК МАССИВ
//! ViewModel
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
          itemBuilder: (context, i) {
            return Card(
              child: ListTile( //! элементы
                title: Text(
                  allNotes[i].title.toString(),
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple,
                  ),
                ),
                subtitle: Text(
                  allNotes[i].text.toString(),
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
                trailing: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit_note', arguments: i); //! дал аргумент
                          model.setControllers(i);
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.iconsColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          model.deleteNote(i);
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: AppColors.iconsColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          model.onCheck(i, allNotes);
                        },
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: allNotes[i].isChecked ? Colors.green :AppColors.iconsColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, i) => const SizedBox(height: 20),
          itemCount:allNotes.length, 
        );
      }
    );
  
  }
}
