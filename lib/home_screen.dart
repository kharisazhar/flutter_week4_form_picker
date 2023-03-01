import 'package:flutter/material.dart';
import 'package:flutter_week4_form_picker/advance_form/color_picker/color_picker_page.dart';
import 'package:flutter_week4_form_picker/advance_form/date_picker/date_picker_page.dart';

import 'advance_form/file_picker/file_picker_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fileResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome John"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute<String>(
                      builder: (_) => const FilePickerPage(
                            name: 'Kharis',
                          )))
                  .then((value) => {
                        debugPrint('Hasil back dari filePickerPage $value'),
                        fileResult = value,
                        setState(() {})
                      }),
              title: const Text('File Picker'),
              subtitle: Text("File Result = $fileResult"),
            ),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DatePickerPage())),
                title: const Text('Date Picker')),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ColorPickerPage())),
                title: const Text('Color Picker')),
          ],
        ),
      ),
    );
  }
}
