import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/presentation/show_details.dart';
import 'package:flutter_application_1/provider/delete_provider.dart';
import 'package:flutter_application_1/provider/searchProvider.dart';
import 'package:provider/provider.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
        builder: (BuildContext ctx, SearchProvider studentList, Widget? child) {
      return studentList.foundStudents.isEmpty
          ? Center(
              child: Text('no data'),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final data = studentList.foundStudents[index];
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
                            id: data.id.toString()),
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
                      DeleteItem.deleteItem(context, data.id, controller);
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
              itemCount: studentList.foundStudents.length,
            );
    });
  }
}
