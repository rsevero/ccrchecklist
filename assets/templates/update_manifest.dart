import 'dart:convert';
import 'dart:io';

void main() async {
  // Get the current directory
  final directory = Directory.current;

  // Define the path to the manifest.json file
  final manifestPath = File('${directory.path}/manifest.json');

  // Find all .ccrt files in the directory
  final ccrtFiles = directory
      .listSync()
      .where((file) => file.path.endsWith('.ccrt'))
      .map((file) => file.uri.pathSegments.last)
      .toList();

  // Sort the list of .ccrt files alphabetically
  ccrtFiles.sort();

  // Create the updated manifest data
  final manifestData = {
    "templates": ccrtFiles,
  };

  // Write the updated manifest data to the manifest.json file
  await manifestPath.writeAsString(
    JsonEncoder.withIndent('  ').convert(manifestData),
  );

  print('Updated ${manifestPath.path} with ${ccrtFiles.length} .ccrt files.');
}
