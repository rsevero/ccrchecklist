import 'dart:io';

void main() async {
  final directory = Directory.current.path;
  final oldWord = 'ccr_checklist';
  final newWord = 'ccrchecklist';

  await replaceWordInDirectory(directory, oldWord, newWord);
  print('Word replacement completed.');
}

Future<void> replaceWordInDirectory(
    String directory, String oldWord, String newWord) async {
  final dir = Directory(directory);
  await for (var entity in dir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('rename.dart')) {
      print('Skipped ${entity.path} (rename.dart file)');
    } else if (entity is File) {
      await replaceWordInFile(entity, oldWord, newWord);
    }
  }
}

Future<void> replaceWordInFile(
    File file, String oldWord, String newWord) async {
  try {
    final content = await file.readAsString();
    final updatedContent = content.replaceAll(oldWord, newWord);
    await file.writeAsString(updatedContent);
    print('Updated ${file.path}');
  } catch (e) {
    print('Skipped ${file.path} (Error: $e)');
  }
}
