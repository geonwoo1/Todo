import 'package:flutter/material.dart';
import 'package:todo/view/BottomNavi.dart';
import 'package:todo/view/homePage.dart';
import 'package:todo/view/calendarPage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo/view/TapbarWidget.dart';
import 'package:todo/view/writePage.dart';
void main() async {
  //달력 한글로 바꾸기 위해 설정
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(100))
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(100) ),
        ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.black
      )),
      title: '건우Todo',
      home: bottomNavi()
    );
  }
}

