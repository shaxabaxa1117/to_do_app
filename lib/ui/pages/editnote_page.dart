// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';
import 'package:to_do_app/ui/widgets/form_widget.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final index = arg is int ? arg : 0;
    final model = context.watch<NotesProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: (AppBar(
        title: Text(
          'Edit Task',
          style: AppStyle.fontStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 35,
          ),
        ),
        backgroundColor: AppColors.purple,
      )
      ),
      body: FormWidget(
        buttonName: 'Update',
        func: () {
          model.onChange(context, index);
        },
      ),
    );
  }
}
