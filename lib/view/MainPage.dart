import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';
import 'package:todo/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.pink,
        title: Text("ToDo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          MyFlutterApp.pencil_alt,
        ),
      ),
      body: SafeArea(child: GetBuilder<TodoController>(builder: (controller) {
        return SlidingUpPanel(
          color: Colors.red,
          minHeight: h * 0.2,
          maxHeight: h * 0.8,
          panelBuilder: (ScrollController sc) => Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: h * 0.01,
                  width: w * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.pinkAccent.withOpacity(0.7),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: sc,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: h * 0.05),
                          Text(
                            "할 일",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          controller.titleArr.length != 0
                              ? Container(
                                  height: h * 0.3,
                                  width: w * 0.9,
                                  child: ListView.builder(
                                    itemCount: controller.titleArr.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap:(){
                                          print(controller.titleArr[index]);
                                          Get.defaultDialog(
                                            title: controller.titleArr[index]['title'],
                                         middleText: controller.titleArr[index]['desc']
                                          );

                                        } ,
                                        child: Card(
                                            child: ListTile(
                                          leading: Checkbox(
                                            activeColor: Colors.white,
                                            checkColor: Colors.green,
                                            onChanged: (value) {
                                              {
                                                controller.todoComplted(
                                                    value,
                                                    controller.titleArr[index]
                                                        ['index']);
                                                controller.titleArr[index]
                                                    ['complted'] = value;
                                              }
                                              ;
                                            },
                                            value: controller.titleArr[index]
                                                ['complted'],
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
                                          title: Text(controller.titleArr[index]
                                              ['title']),
                                        )),
                                      );
                                    },
                                  ),
                                )
                              : Center(child: Text("할일이 없습니다")),
                          const SizedBox(height: 40),
                          Text("완료한 일",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          controller.completedArr.length != 0
                              ? Container(
                                  height: h * 0.3,
                                  width: w * 0.9,
                                  child: ListView.builder(
                                    itemCount: controller.completedArr.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          trailing: IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  buttonColor: Colors.red,
                                                  textConfirm: "삭제",
                                                  confirmTextColor:
                                                      Colors.white,
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
                                          title: Text(controller
                                              .completedArr[index]['title']),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Center(child: Text("완료한 일정이 없습니다.")),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          body: Container(
            color: Colors.white,
            child: TableCalendar(
              //달력 내용
              focusedDay: controller.focusedDay1,
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime(2030, 1, 31),
              locale: 'ko-KR',
              onDaySelected: ((selectedDay, focusedDay) {
                controller.change(selectedDay, focusedDay);
              }),
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay1, day);
              },
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
              calendarStyle: CalendarStyle(
                markersMaxCount: 3,
                selectedDecoration: BoxDecoration(
                  color: Colors.lightGreen.withOpacity(0.7),
                    shape: BoxShape.circle
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                //일정있는 달 표시
                markerDecoration:
                    BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
              ),
              eventLoader: (day) {
                return controller.eventAdd(day);
              },
            ),
          ),
        );
      })),
    );
  }
}
