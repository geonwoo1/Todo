import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';
import 'package:todo/view/TapbarWidget.dart';

class homePage extends StatelessWidget {
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            title: TabBar(
              tabs: [
                Tab(
                  text: "today",
                ),
                Tab(
                  text: "upcoming",
                )
              ],indicatorWeight:1 ,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
            ),
        ),
        body:TabBarView(children: [today(h, w),upcomig(h, w)],)
      ),
    );
  }
}
