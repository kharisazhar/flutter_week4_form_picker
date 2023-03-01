import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  // create some values
  Color pickerColor = Color(0xff443a49);

  Color currentColor = Color(0xff443a49);

  // ValueChanged<Color> callback
  // void changeColor(Color color) {
  //   setState(() => pickerColor = color);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("Pick a Color : $pickerColor"),
          Container(
            width: 200,
            height: 200,
            color: pickerColor,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: Material(
                            child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: (Color color) {
                                  setState(() {
                                    pickerColor = color;
                                  });
                                }),
                          ),
                        ),
                        actions: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () {
                                // setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text("Pick me"))
                        ],
                      );
                    });
              },
              child: const Text(" Select color here ")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, pickerColor);
              },
              child: const Text("SAVE"))
        ],
      )),
    );
  }
}
