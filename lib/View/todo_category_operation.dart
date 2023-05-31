import 'package:flutter/material.dart';

class TodoCategoryOperation extends StatefulWidget {
  const TodoCategoryOperation({Key? key}) : super(key: key);

  @override
  _TodoCategoryOperationState createState() => _TodoCategoryOperationState();
}

class _TodoCategoryOperationState extends State<TodoCategoryOperation> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [addCategory(), getButton()],
        ));
  }

  Widget addCategory() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
          labelText: 'Enter your category', hintText: 'Category'),
      keyboardType: TextInputType.name,
    );
  }

  Widget getButton() {
    return ElevatedButton(
        onPressed: () {
          var category = nameController.toString();
          if (category.isNotEmpty) {
            Navigator.pop(context, category);
          }
        },
        child: const Text(
          'ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
