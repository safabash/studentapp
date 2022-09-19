import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/data_model.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/presentation/home.dart';
import 'package:flutter_application_1/provider/image_provider.dart';

import 'package:provider/provider.dart';

class EditDetails extends StatelessWidget {
  EditDetails({
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

  final formkey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: name);
    courseController = TextEditingController(text: course);
    addressController = TextEditingController(text: address);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 42, 116, 46),
          title: const Text('Student Details'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File(
                            Provider.of<ImageChangeProvider>(context,
                                            listen: true)
                                        .img
                                        ?.path ==
                                    null
                                ? image
                                : Provider.of<ImageChangeProvider>(context,
                                        listen: false)
                                    .img!
                                    .path)),
                      ),
                      Positioned(
                        bottom: 18,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            Provider.of<ImageChangeProvider>(context,
                                    listen: false)
                                .getImage();
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 19, 53, 36),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36)),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Enter your name',
                        contentPadding: const EdgeInsets.all(20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: courseController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 19, 53, 36),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36)),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Enter your course',
                        contentPadding: const EdgeInsets.all(20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 19, 53, 36),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36)),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Enter your address',
                        contentPadding: const EdgeInsets.all(20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 4, 122, 73)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 206, 236, 239))))),
                    onPressed: () {
                      formkey.currentState!.validate();
                      onAddStudentButtonClicked(context);
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> onAddStudentButtonClicked(context) async {
    final student = StudentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        course: courseController.text,
        address: addressController.text,
        image: Provider.of<ImageChangeProvider>(context, listen: false)
                .img
                ?.path ??
            image);
    await DbFunctionsProvider().EditStudentDetails(index, student);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false);
  }
}
