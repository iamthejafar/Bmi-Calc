import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
void main(){
  return runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kScaffoldBackground,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: Colors.white,
        )
      ),
      home: const InputPage(),
    )
  );
}