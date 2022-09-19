import 'package:flutter/material.dart';

import 'package:flutter_application_1/provider/searchProvider.dart';
import 'package:provider/provider.dart';

class DeleteItem {
  static Future<void> deleteItem(
      BuildContext context, String id, TextEditingController controller) async {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    SearchProvider().deletestudent(id.toString());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Successfully deleted'),
                      duration: Duration(seconds: 2),
                    ));
                    Provider.of<SearchProvider>(context, listen: false)
                        .getAll();

                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
            ],
          );
        });
  }
}
