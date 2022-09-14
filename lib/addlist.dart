import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/data_model.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddDetails extends StatefulWidget {
  AddDetails({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  Center(
                    child: Stack(
                      children: [
                        _image?.path == null
                            ? const CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    AssetImage('assets/flutterlogo.jpeg'),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(File(_image!.path)),
                              ),
                        Positioned(
                          bottom: 18,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      onAddStudentButtonClicked();
                      formkey.currentState!.validate();
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

  void showSaved() => Fluttertoast.showToast(
        msg: "Saved",
        fontSize: 18,
      );

  Future<void> onAddStudentButtonClicked() async {
    final name = nameController.text.trim();
    final course = courseController.text.trim();
    final address = addressController.text.trim();
    if (name.isEmpty || course.isEmpty || address.isEmpty) {
      return;
    }
    showSaved();
    final student = StudentModel(
        name: name, course: course, address: address, image: _image!.path);
    addStudent(student);
  }

  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    }
  }
}
