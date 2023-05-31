import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TodoCategoryItemForm extends StatefulWidget {
  const TodoCategoryItemForm({Key? key}) : super(key: key);

  @override
  _TodoCategoryItemFormState createState() => _TodoCategoryItemFormState();
}

class _TodoCategoryItemFormState extends State<TodoCategoryItemForm> {
  final _formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  String? dueDate;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: getCategoryName(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: getDueDate(),
              )
            ],
          )),
    );
  }

  Widget getCategoryName() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(labelText: 'Enter Your Category Name', hintText: 'Todo Name'),
      keyboardType: TextInputType.name,
    );
  }

  Widget getDueDate() {
    return GestureDetector(onTap: () async{
      var date = await getDatePicker();
      if(date != null)
      {
          
          setState(() {
            dueDate = '${date.day}-${date.month}-${date.year}';
          });
      }
      
    },child:  Text(dueDate == null? 
    'Choose a date': dueDate!));
  }

  Future<DateTime?> getDatePicker() async{
    var pickedDate = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2018, 3, 5),
      maxTime: DateTime(2019, 6, 7),
    );
    return pickedDate;
  }
}
