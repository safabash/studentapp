import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/show_details.dart';

import 'model/data_model.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({Key? key}) : super(key: key);

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
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
                trailing: IconButton(
                  onPressed: () {
                    deleteStudents(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length,
          );
        });
  }
}
