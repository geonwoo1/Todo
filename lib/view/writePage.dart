import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/WriteController.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';
import 'package:todo/view/MainPage.dart';

import '../controller/TodoCotroller.dart';

class writePage extends StatelessWidget {
  writePage({Key? key}) : super(key: key);


  final controller = Get.put(writeController());
  final controller2 = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    var a = Get.arguments;
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 100,
            child: Container(
              width: w,
              height: h,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "2023-01-23",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(()=>
                              IconButton(onPressed:(){
                                controller.colorChange();
                              },
                              padding: EdgeInsets.only(left: w*0.6),
                              icon:controller.star==false ?
                              Icon(MyFlutterApp.star,color: Colors.grey.shade300,
                              size: 40,): Icon(MyFlutterApp.star,color: Colors.yellow,
                                size: 40,)

                              )
                          )],
                      )),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade400,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '할일을 입력해주세요.',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.5,
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade400,
                    ),
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        hintText: '할일에 대해 설명을 입력해주세요.',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.1,
                        width: w * 0.45,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("취소"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent.shade100
                          ),
                        ),
                      ),
                      Container(
                          height: h * 0.1,
                          width: w * 0.45,
                          child: ElevatedButton(
                            onPressed: () {
                              controller2.insertTodo(a['titleArr'],a['completedArr']);
                              Get.to(MainPage());
                            },
                            child: Text("작성하기"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
