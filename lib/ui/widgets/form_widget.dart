// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key, required this.buttonName, required this.func});
  final String buttonName;
  final Function func;
  @override
  Widget build(BuildContext context) {
    final titleController = context.read<NotesProvider>().titleController;
    final textController = context.read<NotesProvider>().textController;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      child: Column(
        children: [
          //
          TextFieldWidget(
            controller: titleController,//! отсюда инфомация lib\domain\provider\notes_provider.dart
            hintText: 'Title',
          ),
          //
          SizedBox(
            height: 40,
          ),
          //
          TextFieldWidget(
            controller: textController,//! отсюда инфомация lib\domain\provider\notes_provider.dart
            hintText: 'Detail',
          ),
          SizedBox(height: 40,),
          //
          SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                func(); //! the func 
              },
              child: Text(
                buttonName,
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: UnderlineInputBorder(),
          hintStyle:
              AppStyle.fontStyle.copyWith(fontSize: 16, color: AppColors.grey)),
    );
  }
}
