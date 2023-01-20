import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:todo/main.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: TableCalendar(
        //달력 내용
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime(2030, 1, 31),
        locale: 'ko-KR',
        //달력 위에 부분 꾸미기
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // 주말 표시
          calendarStyle:CalendarStyle(
            weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          ),

      ),
    ));
  }
}
