import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/show_details.dart';

import 'model/data_model.dart';
import 'functions/data_functions.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              if (data.name.toLowerCase().contains(query.toLowerCase())) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(ctx).push(
                          MaterialPageRoute(
                            builder: (context) => Show_details(
                              name: data.name,
                              course: data.course,
                              address: data.address,
                              index: index,
                              image: data.image,
                            ),
                          ),
                        );
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: studentList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              if (data.name.toLowerCase().contains(query.toLowerCase())) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(ctx).push(
                          MaterialPageRoute(
                            builder: (context) => Show_details(
                                name: data.name,
                                course: data.course,
                                address: data.address,
                                index: index,
                                image: data.image),
                          ),
                        );
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: studentList.length,
          );
        });
  }
}
