import 'package:work_space/file_handling/todo_file_handline.dart';
import 'package:work_space/model/todo_category_item.dart';

Future addTodo(String category, TodoItem item) async {
  var todos = await readTodos(category);
  todos.add(item);
  await writeTodos(category, todos);
}


Future deleteTodo(String category,TodoItem item) async{

  var todos = await readTodos(category);
  todos.removeWhere((element) => element.name == item.name);
  await writeTodos(category, todos);

}

Future<List<TodoItem>> getTodos(String category) async
{
    return await readTodos(category);
}