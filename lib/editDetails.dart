import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/data_model.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/home.dart';
import 'package:image_picker/image_picker.dart';

class EditDetails extends StatefulWidget {
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
  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController addressController;
  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    courseController = TextEditingController(text: widget.course);
    addressController = TextEditingController(text: widget.address);
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
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
                  Stack(
                    children: [
                      _image?.path == null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(File(widget.image)),
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

  Future<void> onAddStudentButtonClicked() async {
    final student = StudentModel(
        name: nameController.text,
        course: courseController.text,
        address: addressController.text,
        image: widget.image);
    await EditStudentDetails(widget.index, student);
    if (!mounted) {
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);
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
