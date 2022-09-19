import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/addlist.dart';

import 'package:flutter_application_1/presentation/list.dart';

import 'package:provider/provider.dart';

import '../provider/searchProvider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).getAll();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<SearchProvider>(
              builder: (context, values, child) {
                return TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                    ),
                    onChanged: (value) =>
                        Provider.of<SearchProvider>(context, listen: false)
                            .runFilter(value));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListStudents(
                controller: searchController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
