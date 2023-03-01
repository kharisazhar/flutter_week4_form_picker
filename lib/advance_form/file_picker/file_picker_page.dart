import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  final String name;

  const FilePickerPage({Key? key, required this.name}) : super(key: key);

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  File? fileResult;

  void _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    // final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileResult = File(result.files.single.path ?? '');
      debugPrint("FILE_RESULT : ${fileResult?.path}");
      setState(() {});
      // _openFile(result.files.first);
    } else {}
  }

  void _openFile(PlatformFile file) {
    // OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// List.add
            Text("Please ${widget.name} pick a File"),
            ElevatedButton(
                onPressed: () {
                  _pickFile();
                },
                child: const Text("Pick and open files")),

            /// Cara 1.
            // fileResult?.path != null
            //     ? Image.file(File(fileResult!.path))
            //     : Container()
            /// Cara 2.
            Visibility(
                visible: fileResult?.path != null,
                replacement: const Text('File Belum di pilih'),
                child: Image.file(File(fileResult?.path ?? '/'))),

            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, fileResult?.path);
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
