import 'dart:io';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:path_provider/path_provider.dart';

Future<Directory> ccrGetSharedDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final sharedDirectory =
      Directory('${directory.path}/$ccrDirectory/$ccrShareDirectory');

  // Ensure the directory exists
  sharedDirectory.createSync(recursive: true);

  return sharedDirectory;
}

Future<Directory> ccrGetTemplatesDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final templateDirectory =
      Directory('${directory.path}/$ccrDirectory/$ccrTemplatesDirectory');

  // Ensure the directory exists
  templateDirectory.createSync(recursive: true);

  return templateDirectory;
}
