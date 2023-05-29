import 'package:flutter/material.dart';
import 'package:work_space/service/todo_category_service.dart';
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

  void addCategoryItem() async{
    await addCategory('physical fitness');
    setState(() {
      
    });
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
          onLongPress: () async{
            await deleteCategory(category);
            setState(() {
              
            });
          },
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TodoView(category: category);
            },));
          },
        );
      },
    );
  }
}
