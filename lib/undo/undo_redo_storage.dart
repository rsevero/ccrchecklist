class UndoRedoStorage {
  final Map<String, List<UndoRedoOperation>> _undoMap = {};
  final Map<String, List<UndoRedoOperation>> _redoMap = {};

  UndoRedoStatus addUndo(
      String storeName, String operation, Map<String, dynamic> redoJson,
      {bool clearRedo = true}) {
    if (!_undoMap.containsKey(storeName)) {
      _undoMap[storeName] = [];
    }

    if (clearRedo) {
      _clearRedo(storeName);
    }

    final undoRedoOperation =
        UndoRedoOperation(operation: operation, json: redoJson);
    _undoMap[storeName]!.add(undoRedoOperation);

    final undoStatus = _undoStatus(storeName);

    return UndoRedoStatus(
        canUndo: undoStatus.isAvailable,
        canRedo: false,
        undoDescription: undoStatus.operation,
        redoDescription: '');
  }

  bool _hasUndo(String storeName) {
    return _undoMap.containsKey(storeName) && (_undoMap[storeName]!.length > 1);
  }

  bool _hasRedo(String storeName) {
    return _redoMap.containsKey(storeName) && _redoMap[storeName]!.isNotEmpty;
  }

  UndoOrRedoStatus _redoStatus(String storeName) {
    final isAvailable = _hasRedo(storeName);
    final operation =
        isAvailable ? 'Redo ${_redoMap[storeName]!.last.operation}' : '';
    return UndoOrRedoStatus(isAvailable: isAvailable, operation: operation);
  }

  UndoOrRedoStatus _undoStatus(String storeName) {
    final isAvailable = _hasUndo(storeName);
    final operation =
        isAvailable ? 'Undo ${_undoMap[storeName]!.last.operation}' : '';
    return UndoOrRedoStatus(isAvailable: isAvailable, operation: operation);
  }

  UndoRedoRequest getUndo(String storeName) {
    if (!_hasUndo(storeName)) {
      final redoStatus = _redoStatus(storeName);
      return UndoRedoRequest(
        available: false,
        undoRedoStatus: UndoRedoStatus(
          canUndo: false,
          canRedo: redoStatus.isAvailable,
          undoDescription: '',
          redoDescription: redoStatus.operation,
        ),
      );
    }

    final redoJson = _undoMap[storeName]!.removeLast();
    final operation = redoJson.operation;
    _addRedo(storeName, redoJson);

    final undoJson = _undoMap[storeName]!.last;

    final undoStatus = _undoStatus(storeName);
    final redoStatus = _redoStatus(storeName);

    final undoRedoAnswer = UndoRedoRequest(
        available: true,
        operation: operation,
        json: undoJson.json,
        undoRedoStatus: UndoRedoStatus(
            canUndo: undoStatus.isAvailable,
            canRedo: redoStatus.isAvailable,
            undoDescription: undoStatus.operation,
            redoDescription: redoStatus.operation));

    return undoRedoAnswer;
  }

  UndoRedoRequest getRedo(String storeName) {
    if (!_hasRedo(storeName)) {
      final undoStatus = _undoStatus(storeName);
      return UndoRedoRequest(
        available: false,
        undoRedoStatus: UndoRedoStatus(
          canUndo: undoStatus.isAvailable,
          canRedo: false,
          undoDescription: undoStatus.operation,
          redoDescription: '',
        ),
      );
    }

    final redoJson = _redoMap[storeName]!.removeLast();

    addUndo(storeName, redoJson.operation, redoJson.json, clearRedo: false);

    final undoStatus = _undoStatus(storeName);
    final redoStatus = _redoStatus(storeName);

    final undoRedoAnswer = UndoRedoRequest(
      available: true,
      operation: redoJson.operation,
      json: redoJson.json,
      undoRedoStatus: UndoRedoStatus(
          canUndo: undoStatus.isAvailable,
          canRedo: redoStatus.isAvailable,
          undoDescription: undoStatus.operation,
          redoDescription: redoStatus.operation),
    );

    return undoRedoAnswer;
  }

  void _addRedo(String storeName, UndoRedoOperation redoJson) {
    if (!_redoMap.containsKey(storeName)) {
      _redoMap[storeName] = [];
    }
    _redoMap[storeName]!.add(redoJson);
  }

  void _clearRedo(String storeName) {
    if (_redoMap.containsKey(storeName)) {
      _redoMap.remove(storeName);
    }
  }

  UndoRedoStatus clearRedo(String storeName) {
    _clearRedo(storeName);

    final hasUndo =
        _undoMap.containsKey(storeName) && (_undoMap[storeName]!.length > 1);
    final undoDescription =
        hasUndo ? 'Undo ${_undoMap[storeName]!.last.operation}' : '';

    return UndoRedoStatus(
        canUndo: hasUndo,
        canRedo: false,
        undoDescription: undoDescription,
        redoDescription: '');
  }

  void _clearUndo(String storeName) {
    if (_undoMap.containsKey(storeName)) {
      _undoMap.remove(storeName);
    }
  }

  UndoRedoStatus clearUndoRedo(String storeName) {
    _clearUndo(storeName);
    _clearRedo(storeName);

    return const UndoRedoStatus(
      canUndo: false,
      canRedo: false,
      undoDescription: '',
      redoDescription: '',
    );
  }
}

class UndoRedoStatus {
  final bool canUndo;
  final bool canRedo;
  final String undoDescription;
  final String redoDescription;

  const UndoRedoStatus(
      {required this.canUndo,
      required this.canRedo,
      required this.undoDescription,
      required this.redoDescription});
}

class UndoRedoOperation {
  final String operation;
  final Map<String, dynamic> json;

  const UndoRedoOperation({required this.operation, required this.json});
}

class UndoRedoRequest {
  final bool available;
  final String? operation;
  final Map<String, dynamic>? json;
  final UndoRedoStatus undoRedoStatus;

  const UndoRedoRequest(
      {required this.available,
      this.operation,
      this.json,
      required this.undoRedoStatus});
}

class UndoOrRedoStatus {
  final bool isAvailable;
  final String operation;

  const UndoOrRedoStatus({
    required this.isAvailable,
    required this.operation,
  });
}
