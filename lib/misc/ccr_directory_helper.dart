import 'dart:io';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:path_provider/path_provider.dart';

class CCRDirectory {
  static Future<Directory> shared() async {
    final directory = await getApplicationDocumentsDirectory();
    final sharedDirectory =
        Directory('${directory.path}/$ccrDirectory/$ccrShareDirectory');

    // Ensure the directory exists
    sharedDirectory.createSync(recursive: true);

    return sharedDirectory;
  }

  static Future<Directory> templates() async {
    final directory = await getApplicationDocumentsDirectory();
    final templateDirectory =
        Directory('${directory.path}/$ccrDirectory/$ccrTemplatesDirectory');

    // Ensure the directory exists
    templateDirectory.createSync(recursive: true);

    return templateDirectory;
  }

  static Future<Directory> config() async {
    final directory = await getApplicationDocumentsDirectory();
    final templateDirectory = Directory('${directory.path}/$ccrDirectory');

    // Ensure the directory exists
    templateDirectory.createSync(recursive: true);

    return templateDirectory;
  }
}
