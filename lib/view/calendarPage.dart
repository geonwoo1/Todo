import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';
import 'package:todo/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:todo/view/writePage.dart';

class calendarPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(writePage(),
            arguments:{
            "date": controller.selectedDay1,
            "titleArr":controller.titleArr,
              "completedArr":controller.completedArr},
           opaque: false,
            transition: Transition.downToUp,);
        },
        backgroundColor: Colors.white,
        child: Icon(
          MyFlutterApp.pencil_alt,color: Colors.black,
        ),
      ),
      body: SafeArea(child:
      GetBuilder<TodoController>(builder: (controller) {
        return SlidingUpPanel(
          onPanelOpened: (){
            var value =true;
            controller.calendarChange(value);
          },
          onPanelClosed: (){
            var value =false;
            controller.calendarChange(value);
          },
          borderRadius:BorderRadius.vertical(top: Radius.circular(50)),
          minHeight: h * 0.2,
          maxHeight: h * 0.7,
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
                    color: Colors.black
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
                          SizedBox(height: h * 0.02),
                          DateFormat('yyyyMMdd').format(controller.selectedDay1)!=DateFormat('yyyyMMdd').format(DateTime.now()) ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${DateFormat('yy???MM???dd???').format(controller.selectedDay1)}",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 16
                              ),), TextButton(
                                onPressed: (){
                                        print(DateTime.now());
                                        print(controller.selectedDay1);
                                        controller.change(DateTime.now(), DateTime.now());
                                }, child: Text("?????? ?????? ????????????",style: TextStyle(
                              ),))
                            ],
                          ) :
                          Text("${DateFormat('yy???MM???dd???').format(controller.selectedDay1)}",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),),
                          SizedBox(height: h * 0.03),
                          Text(
                            "??????",
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
                                                        ['index'],controller.focusedDay1);
                                              };
                                            },
                                            value:false
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  buttonColor: Colors.red,
                                                  textConfirm: "??????",
                                                  confirmTextColor: Colors.white,
                                                  textCancel: "??????",
                                                  cancelTextColor: Colors.red,
                                                  onConfirm: () {
                                                    controller.deleteTodo(index,controller.focusedDay1);
                                                    Get.back();
                                                  },
                                                  onCancel: () {
                                                    Get.back();
                                                  },
                                                  title: "????????? ?????? ??????????",
                                                  middleText: "");
                                            },
                                            icon: Icon(
                                              MyFlutterApp.trash_empty,
                                            ),
                                          ),
                                          title: Text(controller.titleArr[index]
                                              ['title']),
                                        )),
                                      );
                                    },
                                  ),
                                )
                              : Center(child: Text("????????? ????????? ????????????",
                              style: TextStyle(
                                  color: Colors.red)
                          )),
                          const SizedBox(height: 40),
                          Text("????????? ??????",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          controller.completedArr.length != 0
                              ? Container(
                                  height: h * 0.3,
                                  width: w * 0.9,
                                  child: ListView.builder(
                                    itemCount: controller.completedArr.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap:(){
                                          Get.defaultDialog(
                                              title: controller.completedArr[index]['title'],
                                              middleText: controller.completedArr[index]['desc']
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
                                                      controller.completedArr[index]
                                                      ['index'],controller.focusedDay1);
                                                };
                                              },
                                              value: true
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    buttonColor: Colors.red,
                                                    textConfirm: "??????",
                                                    confirmTextColor:
                                                        Colors.white,
                                                    textCancel: "??????",
                                                    cancelTextColor: Colors.red,
                                                    onConfirm: () {
                                                      controller.deleteTodo(index,controller.focusedDay1);
                                                      Get.back();
                                                    },
                                                    onCancel: () {
                                                      Get.back();
                                                    },
                                                    title: "????????? ?????? ??????????",
                                                    middleText: "");
                                              },
                                              icon: Icon(
                                                MyFlutterApp.trash_empty,
                                              ),
                                            ),
                                            title: Text(controller
                                                .completedArr[index]['title']),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Center(child: Text("????????? ????????? ????????????.",style: TextStyle(
                            color: Colors.red
                          ),)),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: TableCalendar(
              calendarFormat: controller.calendar,
              //?????? ??????
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
              //?????? ?????? ?????? ?????????
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ?????? ??????
              calendarStyle: CalendarStyle(
                markersMaxCount: 3,
                todayDecoration: BoxDecoration(
                    color:Colors.grey,
                    shape: BoxShape.circle
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                    shape: BoxShape.circle
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.black
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                //???????????? ??? ??????
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