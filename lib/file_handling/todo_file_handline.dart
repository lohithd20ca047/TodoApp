import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../model/todo_category_item.dart';
import 'common.dart';



Future<String> getTodoFileName(String category) async {
  var dirPath = await getTodoDirectoryName();
  return '$dirPath/$category.json';
}

Future<List<TodoItem>> readTodos(String category) async {
  var todoCategoryFileName = await getTodoFileName(category);
  var fileObj = File(todoCategoryFileName);

  if (fileObj.existsSync()) {
    var contents = fileObj.readAsStringSync();
    var contentsJson = jsonDecode(contents);
    var todoObj = Todo.fromJson(contentsJson);
    return todoObj.todoItems;
  }

  return <TodoItem>[];
}


Future writeTodos(String category,List<TodoItem> todos) async
{
   var todoCategoryFileName = await getTodoFileName(category);
  var fileObj = File(todoCategoryFileName);

  var categoriesObj = Todo(name:category,todoItems: todos);
  var categoriesJson = categoriesObj.toJson();
  var contents  = jsonEncode(categoriesJson);
  fileObj.writeAsStringSync(contents);

}
