import 'package:flutter/material.dart';
import 'package:work_space/service/todo_category_service.dart';
import 'package:work_space/view/todo_category_form.dart';
import 'package:work_space/view/todo_view.dart';

class TodoCategories extends StatefulWidget {
  const TodoCategories({Key? key}) : super(key: key);

  @override
  _TodoCategoriesState createState() => _TodoCategoriesState();
}

class _TodoCategoriesState extends State<TodoCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('TODO', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          elevation: 0,
        ),
        body: getAllCategoriesWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: addCategoryItem,
          child: const Icon(Icons.add),
        ));
  }

  void addCategoryItem() async {
    var category = await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: TodoCategoryForm(),
        );
      },
    );
    if (category != null) {
      await addCategory(category);
      setState(() {});
    }
  }

  Widget getAllCategoriesWidget() {
    return FutureBuilder(
      future: getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return getAllCategoriesWidgets(snapshot.data!);
      },
    );
  }

  Widget getAllCategoriesWidgets(List<String> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return ListTile(
          leading: const Icon(Icons.check_box),
          title: Text(
            category,
            style: const TextStyle(fontSize: 15),
          ),
          onLongPress: () async {
            var canDelete = await getDeleteConfirmation();
            if (canDelete == true) {
              deleteCategory(category);
            }
            setState(() {});
          },
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TodoView(category: category);
              },
            ));
          },
        );
      },
    );
  }

  Future<bool> getDeleteConfirmation() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Conformation For Deletion',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          content: const Text("Are you sure to delete this Todo category"),
          actions: [
            ElevatedButton(
              child: const Text('YES'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            ElevatedButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            )
          ],
        );
      },
    );
  }
}
