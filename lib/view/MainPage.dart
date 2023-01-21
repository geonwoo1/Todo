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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.brush,
        ),
      ),
      body: SafeArea(child: GetBuilder<TodoController>(builder: (controller) {
        return SlidingUpPanel(
          color: Colors.red,
          minHeight: 100,
          maxHeight: 350,
          panelBuilder: (ScrollController sc) => Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 6,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.7),
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
                          const SizedBox(height: 25),
                          Text(
                            "할 일",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ) /*,ListView.builder(
                              itemCount: ,
                            ),*/
                          ,
                          const SizedBox(height: 40),
                          Text("완료한 일",
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                controller.showTitle();
                print(DateFormat('yyyyMMdd').format(controller.focusedDay1));
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
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                //일정있는 달 표시
                markerDecoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
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
