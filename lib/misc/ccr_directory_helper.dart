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
