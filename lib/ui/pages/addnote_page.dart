// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';
import 'package:to_do_app/ui/widgets/form_widget.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: Text(
          text,
          style: AppStyle.fontStyle
              .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded,size: 35,color: AppColors.white,),
        ),
      ),
      body: FormWidget(
        buttonName: 'Add',
        func: () => model.addNote(context)//! adding to hive
        
    ));
  }
}
