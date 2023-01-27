import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/icons/my_flutter_app_icons.dart';
import 'package:todo/view/calendarPage.dart';

import '../controller/TodoCotroller.dart';

class writePage extends StatelessWidget {
  writePage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>(); // 폼 키 생성
  final controller2 = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    String? title;
    String? desc;
    var a = Get.arguments; // 메인페이지에서 넘겨준 데이터 받아오기
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
            top:h*0.2,
            child: Container(
              width: w,
              height: h,
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('yy년 MM월 dd일').format(a['date']),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ), IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(MyFlutterApp.cancel,
                                      color: Colors.black,
                                      size: 15,
                                    ))
                        ],
                      )),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            onSaved: (val) {
                             if(val!.length>1){
                               title = val;
                             }
                            },
                            autovalidateMode:AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val!.length < 1) {
                                return "필수입력 항목입니다.";
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "일정을 입력해주세요",
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
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            onSaved: (val) {
                              if(val!.length>=1){
                                desc=val;
                              }else{
                                desc="";
                              }
                            },
                            validator: (val) {
                              return null;
                            },
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: '일정에 대한 설명을 입력해주세요.',
                              border: InputBorder.none,
                            ),
                          ),
                        ),  Container(
                            height: h * 0.05,
                            width: w,
                            padding: EdgeInsets.fromLTRB(w*0.05, 0, w*0.05, 0),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    _key.currentState!.save(); //폼저장하기
                                    controller2.insertTodo(
                                        a['titleArr'], a['completedArr'],title,desc);
                                    Get.back();
                                    Get.snackbar(
                                      '저장완료!',
                                      '할일이 추가되었습니다!',
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                },
                                child: Text("작성하기"),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                                    backgroundColor: Colors.black54)
                            )),




                       /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: h * 0.1,
                              width: w * 0.45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("취소"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white10),
                              ),
                            ),
                            Container(
                                height: h * 0.1,
                                width: w * 0.45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      _key.currentState!.save(); //폼저장하기
                                      controller2.insertTodo(
                                          a['titleArr'], a['completedArr'],title,desc,important);
                                      Get.back();
                                      Get.snackbar(
                                        '저장완료!',
                                        '할일이 추가되었습니다!',
                                        backgroundColor: Colors.white,
                                      );
                                    }
                                  },
                                  child: Text("작성하기"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black26)
                                )),
                          ],
                        ),*/
                      ],
                    ),
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
