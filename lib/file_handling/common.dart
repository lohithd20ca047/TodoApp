import 'package:path_provider/path_provider.dart';

Future<String> getTodoDirectoryName() async {
  var dir = await getApplicationDocumentsDirectory();
  return dir.path;
}