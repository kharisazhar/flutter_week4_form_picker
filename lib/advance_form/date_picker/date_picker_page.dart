import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date Picker
class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  /// 1. Menampung Data Waktu : Tanggal, Hari, Bulan, Tahun, Jam

  /// NullSafety
  /// _selectedDate = Bisa Kosong atau null / Ekspektasi bisa kosong
  DateTime? _selectedDate;

  /// Non null safety
  /// _selectedDate = Wajib ada isi, tidak boleh null / kosong atau ekspektasi pasti terisi data
  // DateTime _selectedDate;

  /// Null Safety : NullSafety

  /// final :
  final String tanggalLahir = '1 Januari 1999';
  final String? tanggalLahir2 = '1 Januari 1999';

  /// late
  late final String tanggalLahir3;
  late String tanggalLahir4;
  late String? tanggalLahir5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1800),
                          lastDate: DateTime(DateTime.now().year + 5))
                      .then((value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  });
                },

                /// ?? di baca ->
                ///
                /// if(_selectedDate != null){
                ///   return _selectedDate
                ///  }else {
                ///     DateTime.now()
                /// }
                child: Text(
                    'Tanggal Lahir : ${DateFormat('dd-MMM-yyyy').format(_selectedDate ?? DateTime.now())}'))
          ],
        ),
      ),
    );
  }
}
