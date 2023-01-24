import 'package:get/get.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/view/FirstPage.dart';
import 'package:todo/view/MainPage.dart';

class LandingPage extends GetxController{
  final currentIndex = 0.obs;
  List pages = [
    FirstPage(),
    MainPage(),
  ];

  get currentPage => pages[currentIndex.value];
  get sel => Get.find<TodoController>().selectedDay1;
  get fo => Get.find<TodoController>().selectedDay1;
  void changePage(int _index) {
    currentIndex.value = _index;
    Get.find<TodoController>().change(sel,fo);
  }

}
