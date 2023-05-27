import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../model/todo_category_item.dart';

const String fileName = 'todo.json';

Future<String> getFullFilePath() async {
  var dir = await getExternalStorageDirectory();
  var fullFilePath = '${dir!.path}/$fileName';
  return fullFilePath;
}

Future<List<TodoCategoryItem>> readAllCategories() async {
  var categories = <TodoCategoryItem>[];
  try {
    var filePath = await getFullFilePath();

    var fileObj = File(filePath);
    if (fileObj.existsSync()) {
      var jsonContents = fileObj.readAsStringSync();
      var categoriesJson = jsonDecode(jsonContents);
      for (var categorieJson in categoriesJson) {
        var person = TodoCategoryItem.fromJson(categorieJson);
        categories.add(person);
      }
    }
  } catch (err) {
    debugPrint(err.toString());
  }

  //add a delay
  //await Future.delayed(const Duration(seconds: 5));

  return categories;
}
