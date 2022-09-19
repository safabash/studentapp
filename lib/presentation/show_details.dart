import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/editDetails.dart';

class Show_details extends StatelessWidget {
  const Show_details(
      {Key? key,
      required this.name,
      required this.course,
      required this.address,
      required this.index,
      required this.image,
      required this.id})
      : super(key: key);
  final String name;
  final String address;
  final String course;
  final int index;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 19, 215),
        title: const Text("Students's Details"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => EditDetails(
                      name: name,
                      course: course,
                      address: address,
                      index: index,
                      image: image,
                    )),
          );
        },
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.add),
        label: const Text("Edit"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 90,
          backgroundImage: FileImage(File(image)),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("Name:$name"),
        const SizedBox(
          height: 10,
        ),
        Text('Course:$course'),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Address:'),
            Text(address),
          ],
        )
      ]),
    );
  }
}
