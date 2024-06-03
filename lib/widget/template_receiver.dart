import 'dart:async';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class FileReceiverScreen extends StatefulWidget {
  const FileReceiverScreen({super.key});

  @override
  State<FileReceiverScreen> createState() => _FileReceiverScreenState();
}

class _FileReceiverScreenState extends State<FileReceiverScreen> {
  StreamSubscription<List<SharedMediaFile>>? _intentDataStreamSubscription;
  List<SharedMediaFile>? _sharedFiles;

  @override
  void initState() {
    super.initState();

    // For app already opened
    _intentDataStreamSubscription =
        ReceiveSharingIntent.instance.getMediaStream().listen(
      (List<SharedMediaFile> value) {
        setState(() {
          _sharedFiles = value;
        });
      },
      onError: (err) {
        print("getMediaStream error: $err");
      },
    );

    // For app closed
    ReceiveSharingIntent.instance.getInitialMedia().then(
      (List<SharedMediaFile> value) {
        setState(
          () {
            _sharedFiles = value;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Shared File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _sharedFiles != null
                ? Column(
                    children: _sharedFiles!.map(
                      (file) {
                        return Text('Received file: ${file.path}');
                      },
                    ).toList(),
                  )
                : const Text('No file received'),
          ],
        ),
      ),
    );
  }
}
