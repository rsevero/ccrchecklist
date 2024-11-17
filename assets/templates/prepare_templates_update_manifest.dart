// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
      .map((file) => File(file.path))
      .toList();

  // Sort the list of .ccrt files alphabetically by their file names
  ccrtFiles.sort((a, b) => a.path.compareTo(b.path));

  // Process each .ccrt file
  for (final file in ccrtFiles) {
    // Read the file contents
    String contents = await file.readAsString();

    // Replace all occurrences of "O2" with "O₂"
    contents = contents.replaceAll('O2', 'O₂');

    // Remove all double spaces
    while (contents.contains('  ')) {
      contents = contents.replaceAll('  ', ' ');
    }

    // Parse the JSON content
    final jsonData = jsonDecode(contents);

    // Update the JSON content
    if (jsonData is Map<String, dynamic>) {
      jsonData['isAsset'] = true;
      jsonData.remove('path');
    }

    final updatedContents = JsonEncoder.withIndent('  ').convert(jsonData);

    // Write the updated contents back to the file
    await file.writeAsString(updatedContents);

    print('Updated ${file.path}');
  }

  // Create the updated manifest data
  final manifestData = {
    "templates": ccrtFiles.map((file) => file.uri.pathSegments.last).toList(),
  };

  // Write the updated manifest data to the manifest.json file
  await manifestPath.writeAsString(
    JsonEncoder.withIndent('  ').convert(manifestData),
  );

  print('Updated ${manifestPath.path} with ${ccrtFiles.length} .ccrt files.');
}
