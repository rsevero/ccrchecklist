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

import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Add/remove templates', () {
    var store = TemplateListStore();

    test('Adding new templates', () {
      store.addNewTemplate(
          path: 'newTemplate1',
          title: 'newTemplate1',
          rebreatherManufacturer: 'rebreatherManufacturer1',
          rebreatherModel: 'rebreatherModel1',
          description: 'description1');
      expect(store.defaultTemplates.length, 1);
      store.addNewTemplate(
          path: 'newTemplate2',
          title: 'newTemplate2',
          rebreatherManufacturer: 'rebreatherManufacturer2',
          rebreatherModel: 'rebreatherModel2',
          description: 'description2');
      expect(store.defaultTemplates.length, 2);
    });

    test('Removing template', () async {
      await store.removeTemplate(0);
      expect(store.defaultTemplates.length, 1);
    });
  });
}
