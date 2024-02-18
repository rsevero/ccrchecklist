import 'package:ccr_checklist/store/template_list_store.dart';
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

    //   test('Removing template', () async {
    //     store.addNewTemplate(
    //         path: 'newTemplate1',
    //         title: 'newTemplate1',
    //         rebreatherManufacturer: 'rebreatherManufacturer1',
    //         rebreatherModel: 'rebreatherModel1',
    //         description: 'description1');
    //     store.addNewTemplate(
    //         path: 'newTemplate2',
    //         title: 'newTemplate2',
    //         rebreatherManufacturer: 'rebreatherManufacturer2',
    //         rebreatherModel: 'rebreatherModel2',
    //         description: 'description2');

    //     await store.removeTemplate(0);
    //     expect(store.defaultTemplates.length, 1);
    //   });
  });
}
