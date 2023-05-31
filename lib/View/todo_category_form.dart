import 'package:flutter/material.dart';

class TodoCategoryForm extends StatefulWidget {
  const TodoCategoryForm({Key? key}) : super(key: key);

  @override
  _TodoCategoryFormState createState() => _TodoCategoryFormState();
}

class _TodoCategoryFormState extends State<TodoCategoryForm> {
  final _formkey = GlobalKey<FormState>();
  var categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Enter a Pimary Task", hintText: "Task"),
                keyboardType: TextInputType.name,
              ),
            ),ElevatedButton(onPressed: () async{
              
            var category = categoryController.text;
            if (category.isNotEmpty) {
              Navigator.pop(context,category);
            }
            }, child: const Text("ADD",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ));
  }
}
