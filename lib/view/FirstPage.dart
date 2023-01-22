import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoCotroller.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';

class FirstPage extends StatelessWidget {

  final controller =Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("ToDo"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h*0.02,
          ),
          Text("다가오는 일정을 확인하세요",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(
            height: h*0.02,
          ),
          GetBuilder<TodoController>(
            builder: (controller){
              return Column(
                children: [
                  Container(
                    height: 500,
                    width: 500,
                    child: ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              child:
                              Text("${controller.list[index].date.substring(4,6)}월 ${controller.list[index].date.substring(6)}일",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),)
                            ),Container(
                              height:200,
                              width:500,
                              child: ListView.builder(
                                itemCount : controller.list[index].content.length,
                                  itemBuilder: (context,idx){
                               return InkWell(
                          onTap:(){
                            Get.defaultDialog(
                                title: "",
                                middleText: "",
                            );
                          } ,
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
                                title: Text(controller.list[index].content[idx].title),
                              )),
                        );
                            },
                            )
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ) ,
    );
  }
}
