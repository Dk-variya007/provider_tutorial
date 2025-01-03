import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/crud_provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key, this.index});

  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController professionController =
      TextEditingController();
  final int? index;

  @override
  Widget build(BuildContext context) {
    if (index != null) {
      final data = context.read<CrudProvider>().getData()[index!];
      nameController.text = data['name'];
      professionController.text = data['profession'];
    }
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: professionController,
              decoration: InputDecoration(
                  labelText: "profession",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                if (index == null) {
                  context.read<CrudProvider>().addData({
                    'name': nameController.text.trim(),
                    'profession': professionController.text.trim(),
                  });
                } else {
                  context.read<CrudProvider>().upData(
                      index!, nameController.text, professionController.text);
                }

                Navigator.pop(context);
                nameController.clear();
                professionController.clear();
              },
              child: Text(index == null ? "Add" : "Update"))
        ],
      ),
    );
  }
}
