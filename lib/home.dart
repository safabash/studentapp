import 'package:flutter/material.dart';
import 'package:flutter_application_1/addlist.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/list.dart';
import 'package:flutter_application_1/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(Icons.search))
        ],
        backgroundColor: const Color.fromARGB(255, 112, 186, 117),
        title: const Text("Students's List"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx1) => AddDetails()),
          );
        },
        icon: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(134, 7, 91, 6),
        label: const Text("Add"),
      ),
      body: const ListStudents(),
    );
  }
}
