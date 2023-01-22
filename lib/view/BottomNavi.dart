import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/LandingPage.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';

class bottomNavi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: Get.put(LandingPage()).currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
          Get.put(LandingPage()).currentIndex.value,
          onTap: Get.put(LandingPage()).changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.home, color: Colors.pinkAccent,),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.calendar,color: Colors.pinkAccent,),
              label: "캘린더",
            ),
          ],
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}