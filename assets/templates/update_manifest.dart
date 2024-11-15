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

  // Process each .ccrt file
  for (final filename in ccrtFiles) {
    final file = File("${directory.path}/$filename");

    // Read the file contents
    final contents = await file.readAsString();

    // Replace all occurrences of "O2" with "O₂"
    final updatedContents = contents.replaceAll('O2', 'O₂');

    // Write the updated contents back to the file
    await file.writeAsString(updatedContents);

    print('Updated $filename');
  }

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
