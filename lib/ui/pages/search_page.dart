// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/database/hive_box.dart';
import 'package:to_do_app/domain/database/notes_data.dart';
import 'package:to_do_app/domain/provider/notes_provider.dart';
import 'package:to_do_app/domain/provider/search_provider.dart';
import 'package:to_do_app/ui/style/app_colors.dart';
import 'package:to_do_app/ui/style/app_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.purple,
          title: Text(
            'Search',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const SearchBody(),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchProvider>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        children: [
          TextField(
            controller: model.searchController, //! query is given right here
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Поиск...'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(
                      model.filteredNotes[i].title.toString(),
                      style: AppStyle.fontStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.purple,
                      ),
                    ),
                    subtitle: Text(
                      model.filteredNotes[i].text.toString(),
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
                              Navigator.pushNamed(context, '/edit_note',
                                  arguments: i);
                            },
                            icon: const Icon(
                              Icons.edit_outlined,
                              color: AppColors.iconsColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // model.deleteNote(i);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: AppColors.iconsColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // model.onCheck(i, allNotes);
                            },
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: model.filteredNotes[i].isChecked
                                  ? Colors.green
                                  : AppColors.iconsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, i) => const SizedBox(height: 20),
              itemCount: model.filteredNotes.length, // значение поменять
            ),
          ),
        ],
      ),
    );
  }
}
