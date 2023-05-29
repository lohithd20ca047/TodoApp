import 'package:flutter/material.dart';
import 'package:work_space/model/todo_category_item.dart';
import 'package:work_space/service/todo_service.dart';

class TodoView extends StatefulWidget {
  final String? category;
  const TodoView({Key? key, required this.category}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodoItem,
        child: const Icon(Icons.add),
      ),
      body: getTodoItemsWidget(),
    );
  }

  Future addTodoItem() async {
    var todoItem = TodoItem(createdDate: '28-05-2023', name: 'Complete recipe app', isCompleted: false, dueDate: '30-05-2023', completedDate: null);
    await addTodo(widget.category!, todoItem);
    setState(() {});
  }

  Widget getTodoItemsWidget() {
    return FutureBuilder(
      future: getTodos(widget.category!),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return getallTodoItems(snapshot.data!);
      },
    );
  }

  Widget getallTodoItems(List<TodoItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];

        return ListTile(
          leading: Text(item.createdDate!),
          title: Text(
            item.name!,
            style: const TextStyle(fontSize: 15),
          ),
          trailing: item.isCompleted! ? const Icon(Icons.check_box) : const Icon(Icons.pending),
          onLongPress: () async {
            await deleteTodo(widget.category!, item);
            setState(() {
              
            });
          },
        );
      },
    );
  }
}
