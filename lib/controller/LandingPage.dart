import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/view/homePage.dart';
import 'package:todo/view/calendarPage.dart';

class LandingPage extends GetxController{
  final currentIndex = 0.obs;
  List pages = [
    homePage(),
    calendarPage(),
  ];

  get currentPage => pages[currentIndex.value];
  get sel => Get.find<TodoController>().selectedDay1;
  get fo => Get.find<TodoController>().selectedDay1;
  void changePage(int _index) {
    currentIndex.value = _index;
    Get.find<TodoController>().change(sel,fo);
    Get.find<TodoController>().calendar =CalendarFormat.month;
  }

}
