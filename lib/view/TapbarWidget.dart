import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TodoCotroller.dart';
import '../icons/my_flutter_app_icons.dart';

Widget today(h, w) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: h * 0.02,
    ),
    Text(
      "오늘 일정",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: h * 0.02,
    ),
    GetBuilder<TodoController>(
      builder: (controller) {
        return Column(
          children: [
            Container(
              height: h * 0.2,
              width: w,
              child: controller.todayList.length >= 1
                  ? ListView.builder(
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
                          height: 200,
                          width: 500,
                          child: ListView.builder(
                            itemCount: controller
                                .todayList[index].content.length,
                            itemBuilder: (context, idx) {
                              return InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "",
                                    middleText: "",
                                  );
                                },
                                child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              buttonColor: Colors.red,
                                              textConfirm: "삭제",
                                              confirmTextColor: Colors.white,
                                              textCancel: "취소",
                                              cancelTextColor: Colors.red,
                                              onConfirm: () {
                                                Get.back();
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                              title: "일정을 삭제 할까요?",
                                              middleText: "");
                                        },
                                        icon: Icon(
                                          MyFlutterApp.cancel_circle,
                                          color: Colors.red,
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
              )
                  : Center(
                  child: Text(
                    "일정이 없습니다.",
                    style: TextStyle(color: Colors.red),
                  )),
            ),
          ],
        );
      },
    ),
  ]);
}

Widget comingWeek(h, w) {
  return Column(children: [
    Container(
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
                                title: "",
                                middleText: "",
                              );
                            },
                            child: Card(
                                child: ListTile(
                                 leading: Checkbox(
                                    activeColor: Colors.white,
                                    checkColor: Colors.green,
                                    onChanged: (value) {
                                      {controller.todoComplted(
                                            value,
                                            idx);
                                        controller.list[index].content[idx].complete = value;
                                      }
                                    },
                                    value: controller.list[index].content[idx].complete,
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
          height: h * 0.4,
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

Widget important(h,w){
  return Column(children: [
    Container(
        child: Text(
          "중요 일정",
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
                                title: "",
                                middleText: "",
                              );
                            },
                            child: Card(
                                child: ListTile(
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
          height: h * 0.4,
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