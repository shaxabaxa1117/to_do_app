// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/ui/pages/addnote_page.dart';
import 'package:to_do_app/ui/pages/editnote_page.dart';
import 'package:to_do_app/ui/pages/search_page.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';
import 'package:to_do_app/ui/widgets/home_widget.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
      routes: {
        '/edit_note':(context) => EditNotePage(),
        '/search_note':(context) => SearchPage(), 

      },
        home: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.purple,

//! buееут at the end of AppBar
            actions: [
              SearchButton()
            ],
            title: Text(
              'Todo App'.toUpperCase(),
              style: AppStyle.fontStyle
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          floatingActionButton: AddButton(),
          body:HomeWidget()),
        ),
      );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.search), onPressed: (){
      Navigator.pushNamed(context, '/search_note');
    },);
  }
}




class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddNotePage(text: 'Add task'.toUpperCase(),);
            },
          ),
        );
      },
      child: Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
