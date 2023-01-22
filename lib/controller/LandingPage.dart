import 'package:get/get.dart';
import 'package:todo/view/FirstPage.dart';
import 'package:todo/view/MainPage.dart';

class LandingPage extends GetxController{

  final currentIndex = 0.obs;
  List pages = [
    FirstPage(),
    MainPage(),
  ];

  get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }

}
