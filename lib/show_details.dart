import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/editDetails.dart';

class Show_details extends StatefulWidget {
  const Show_details({
    Key? key,
    required this.name,
    required this.course,
    required this.address,
    required this.index,
    required this.image,
  }) : super(key: key);
  final String name;
  final String address;
  final String course;
  final int index;
  final String image;
  @override
  State<Show_details> createState() => _Show_detailsState();
}

class _Show_detailsState extends State<Show_details> {
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
                      name: widget.name,
                      course: widget.course,
                      address: widget.address,
                      index: widget.index,
                      image: widget.image,
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
          backgroundImage: FileImage(File(widget.image)),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("Name:${widget.name}"),
        const SizedBox(
          height: 10,
        ),
        Text('Course:${widget.course}'),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Address:'),
            Text(widget.address),
          ],
        )
      ]),
    );
  }
}
