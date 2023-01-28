import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TodoCotroller.dart';
import '../icons/my_flutter_app_icons.dart';

Widget today(h, w) {
  return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: h * 0.02,
    ),
    Container(
      padding: EdgeInsets.only(left: w*0.02),
      child: Text(
        "오늘 일정",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    SizedBox(
      height: h * 0.02,
    ),
    GetBuilder<TodoController>(
      builder: (controller) {
        return  controller.todayList.length >= 1
            ? Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: w*0.02),
              height: h * 0.2,
              width: w,
              child: ListView.builder(
                itemCount: controller.todayList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                            "${controller.todayList[index].date.substring(4, 6)}월 ${controller.todayList[index].date.substring(6)}일",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          height: h*0.7,
                          width: w,
                          child: ListView.builder(
                            itemCount: controller
                                .todayList[index].content.length,
                            itemBuilder: (context, idx) {
                              return InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: controller.todayList[index]
                                        .content[idx].title,
                                    middleText: controller.todayList[index]
                                        .content[idx].desc,
                                  );
                                },
                                child: Card(
                                    child: ListTile(
                                     leading: Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: Colors.green,
                                        onChanged: (value) {
                                          var a =int.parse(controller.todayList[index].date.substring(0, 4)) ;
                                          var b =int.parse(controller.todayList[index].date.substring(4,6));
                                          var c =int.parse(controller.todayList[index].date.substring(6));
                                          {controller.todoComplted(
                                              value,
                                              idx,DateTime.utc(a,b,c));
                                          controller.todayList[index].content[idx].complete = value;
                                          }
                                        },
                                        value: controller.todayList[index].content[idx].complete,
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              buttonColor: Colors.red,
                                              textConfirm: "삭제",
                                              confirmTextColor: Colors.white,
                                              textCancel: "취소",
                                              cancelTextColor: Colors.red,
                                              onConfirm: () {
                                                controller.deleteTodo(idx,DateTime.now());
                                                Get.back();
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                              title: "일정을 삭제 할까요?",
                                              middleText: "");
                                        },
                                        icon: Icon(
                                          MyFlutterApp.trash_empty,
                                        ),
                                      ),
                                      title: Text(controller.todayList[index]
                                          .content[idx].title),
                                    )),
                              );
                            },
                          )),
                    ],
                  );
                },
              ),
            )]):  Container(
          height: h*0.7,
              child: Center(
        child: Text(
        "일정이 없습니다.",
        style: TextStyle(color: Colors.red),
        )
        ),
            );
      },
    ),
  ]);
}

Widget upcomig(h, w) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * 0.02,
        ),
    Container(
      padding: EdgeInsets.only(left: w*0.02),
        child: Text(
          "다가오는 일정",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
    SizedBox(
      height: h * 0.02,
    ),
    GetBuilder<TodoController>(
      builder: (controller) {
        return controller.list.length >= 1
            ? Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: w*0.02),
                      child: Text(
                        "${controller.list[index].date.substring(4, 6)}월 ${controller.list[index].date.substring(6)}일",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: h * 0.15,
                      child: ListView.builder(
                        itemCount: controller.list[index].content.length,
                        itemBuilder: (context, idx) {
                          return InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                title: controller
                                    .list[index].content[idx].title,
                                middleText: controller
                                    .list[index].content[idx].desc,
                              );
                            },
                            child: Card(
                                child: ListTile(
                                 leading: Checkbox(
                                    activeColor: Colors.white,
                                    checkColor: Colors.green,
                                    onChanged: (value) {
                                      var a =int.parse(controller.list[index].date.substring(0, 4)) ;
                                      var b =int.parse(controller.list[index].date.substring(4,6));
                                      var c =int.parse(controller.list[index].date.substring(6));
                                      controller.todoComplted(value,idx,DateTime.utc(a,b,c));
                                      print(idx);
                                    /*  {*//*controller.todoComplted(
                                            value,
                                            idx,);
                                        controller.list[index].content[idx].complete = value;*//*
                                      }*/
                                    },
                                    value: controller.list[index].content[idx].complete,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          buttonColor: Colors.red,
                                          textConfirm: "삭제",
                                          confirmTextColor: Colors.white,
                                          textCancel: "취소",
                                          cancelTextColor: Colors.red,
                                          onConfirm: () {
                                            var a =int.parse(controller.list[index].date.substring(0, 4)) ;
                                            var b =int.parse(controller.list[index].date.substring(4,6));
                                            var c =int.parse(controller.list[index].date.substring(6));
                                            controller.deleteTodo(idx,DateTime.utc(a,b,c));
                                            print(idx);
                                            Get.back();
                                          },
                                          onCancel: () {
                                            Get.back();
                                          },
                                          title: "일정을 삭제 할까요?",
                                          middleText: "");
                                    },
                                    icon: Icon(
                                      MyFlutterApp.trash_empty,
                                    ),
                                  ),
                                  title: Text(controller
                                      .list[index].content[idx].title),
                                )),
                          );
                        },
                      )),
                ],
              );
            },
          ),
        )
            : Container(
          height: h * 0.7,
          child: Center(
            child: Text(
              "일정이 없습니다.",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    ),
  ]);
}
