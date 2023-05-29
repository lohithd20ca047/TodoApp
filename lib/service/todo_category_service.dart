

import '../file_handling/catrgory_file_handling.dart';

Future addCategory(String category) async
{
    var existingCategories = await readCategories();
    existingCategories.add(category);
    await writeCategories(existingCategories);
}

Future deleteCategory(String category) async
{
    var existingCategories = await readCategories();
    existingCategories.removeWhere((element) => element == category);
    await writeCategories(existingCategories);
}


Future<List<String>> getAllCategories() async{
    return await readCategories();
}