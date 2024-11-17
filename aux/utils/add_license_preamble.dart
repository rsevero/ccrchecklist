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

import 'dart:io';

void main() async {
  // Define the license preamble
  const licensePreamble =
      '''// CCR Checklist - a checklist app for rebreather users
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

''';

  // Function to add license preamble to a file
  Future<void> addLicenseToFile(File file) async {
    final content = await file.readAsString();
    if (!content.startsWith(licensePreamble)) {
      final newContent = licensePreamble + content;
      await file.writeAsString(newContent);
      print('Added license to ${file.path}');
    } else {
      print('License already present in ${file.path}');
    }
  }

  // Walk through the directory and add license preamble to all Dart files
  final directory = Directory('.');
  await for (var entity
      in directory.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      await addLicenseToFile(entity);
    }
  }

  print('License preamble added to all Dart files.');
}
