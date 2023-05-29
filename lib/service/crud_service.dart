import '../file_handling/read_write_file.dart';
import '../model/todo_category.dart';

Future addCategory(TodoCategories category) async {
  var categories = await readAllCategories();
  categories.add(category);
  await writeAllCategories(categories);
}

Future editCategory(
    TodoCategories oldCategory, TodoCategories newCategory) async {
  var categories = await readAllCategories();
  var oldCategoryObj = categories
      .firstWhere((element) => element.categories == oldCategory.categories);
  oldCategoryObj.categories = newCategory.categories;
  await writeAllCategories(categories);
}

Future deleteCategory(TodoCategories category) async {
  var categories = await readAllCategories();
  categories
      .removeWhere((element) => element.categories == category.categories);
  await writeAllCategories(categories);
}
