import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:work_space/model/todo_category.dart';

const String fileName = 'todo.json';

Future<String> getFullFilePath() async {
  var dir = await getExternalStorageDirectory();
  var fullFilePath = '${dir!.path}/$fileName';
  return fullFilePath;
}

Future<List<TodoCategories>> readAllCategories() async {
  var categories = <TodoCategories>[];
  var filePath = await getFullFilePath();

  var fileObj = File(filePath);
  if (fileObj.existsSync()) {
    var jsonContents = fileObj.readAsStringSync();
    var categoriesJson = jsonDecode(jsonContents);
    for (var element in categoriesJson) {
      var categoryObj = TodoCategories.fromJson(categoriesJson);
      categories.add(categoryObj);
    }
  }
  return categories;
}

Future writeAllCategories(List<TodoCategories> categories) async {
  var filePath = await getFullFilePath();
  var json = jsonEncode(categories);
  var fileObj = File(filePath);
  fileObj.writeAsStringSync(json, mode: FileMode.write);
}
