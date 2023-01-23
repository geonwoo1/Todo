import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo/controller/TodoCotroller.dart';
class writeController extends GetxController{
  RxBool star =false.obs;
  void colorChange(){
    star.toggle();
  }

}