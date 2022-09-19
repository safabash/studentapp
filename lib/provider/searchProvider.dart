import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/model/data_model.dart';

class SearchProvider with ChangeNotifier {
  final List<StudentModel> studentList = DbFunctionsProvider.studentList;

  List<StudentModel> foundStudents = [];
  Future<void> getAll() async {
    final students = await DbFunctionsProvider().getAllStudents();
    foundStudents = students;

    notifyListeners();
  }

  Future<void> deletestudent(String id) async {
    await DbFunctionsProvider().deleteStudents(id.toString());
    notifyListeners();
  }

  void runFilter(String enteredKeyword) {
    List<StudentModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = studentList;
    } else
      results = studentList
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

    foundStudents = results;
    notifyListeners();
  }
}
