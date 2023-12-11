class UndoRedoStorage {
  final Map<String, List<Map<String, dynamic>>> _undoMap = {};
  final Map<String, List<Map<String, dynamic>>> _redoMap = {};

  void addUndo(String storeName, Map<String, dynamic> redoJson) {
    if (!_undoMap.containsKey(storeName)) {
      _undoMap[storeName] = [];
    }
    _undoMap[storeName]!.add(redoJson);
  }

  Map<String, dynamic>? getUndo(String storeName) {
    if (!_undoMap.containsKey(storeName)) {
      return null;
    }
    final undoList = _undoMap[storeName]!;
    if (undoList.isEmpty) {
      return null;
    }
    final undoJson = undoList.removeLast();
    _addRedo(storeName, undoJson);

    return undoList.last;
  }

  void _addRedo(String storeName, Map<String, dynamic> undoJson) {
    if (!_redoMap.containsKey(storeName)) {
      _redoMap[storeName] = [];
    }
    _redoMap[storeName]!.add(undoJson);
  }

  void clearRedo(String storeName) {
    if (!_redoMap.containsKey(storeName)) {
      return;
    }
    _redoMap.remove(storeName);
  }
}
