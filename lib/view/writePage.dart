import 'package:flutter/material.dart';
import 'package:get/get.dart';

class writePage extends StatelessWidget {
  const writePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [Container(
          color: Colors.black.withOpacity(0.3),
        ),AnimatedPositioned(
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
                          child: Text("2023-01-23",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 10,),
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
                      Expanded(
                        child: Container(
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
                      )
                    ],
                  ),
                ),
        ),
            ],
          ),
    );
  }
}

