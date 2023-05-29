import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../model/todo_category.dart';
import 'common.dart';



Future<String> getCategoryFileName() async {
  var dirPath = await getTodoDirectoryName();
  return '$dirPath/Catrgories.json';
}

Future<List<String>> readCategories() async {
  var todoCategoryFileName = await getCategoryFileName();
  var fileObj = File(todoCategoryFileName);

  if (fileObj.existsSync()) {
    var contents = fileObj.readAsStringSync();
    var contentsJson = jsonDecode(contents);
    var categoriesObj = TodoCategories.fromJson(contentsJson);
    return categoriesObj.categories;
  }

  return <String>[];
}


Future writeCategories(List<String> categories) async
{
   var todoCategoryFileName = await getCategoryFileName();
  var fileObj = File(todoCategoryFileName);

  var categoriesObj = TodoCategories(categories: categories);
  var categoriesJson = categoriesObj.toJson();
  var contents  = jsonEncode(categoriesJson);
  fileObj.writeAsStringSync(contents);

}
