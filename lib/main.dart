import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolistapp/Constants/Color.dart';
import 'package:todolistapp/Screen/list_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do Apps',
      theme: ThemeData(
        primarySwatch: orange300Swatch,
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith(
                  (_) => const BorderSide(width: 1, color: Colors.grey)),
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: MaterialStateProperty.all(Colors.orange),
        ),
      ),
      home: const ListPage(title: 'To-Do List'),
    );
  }
}



