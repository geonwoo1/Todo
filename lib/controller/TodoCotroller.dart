import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/TodoList.dart';


class TodoController extends GetxController{
  DateTime focusedDay1 = DateTime.now();
  DateTime selectedDay1 = DateTime.now();

  var event=[];
  var aa;
  var count;
  var todo3;

  var todo2 = [TodoList(date:"20230121",
      content:[Content(
          title:"플러터공부하기",
          desc:"getx공부",
          complete: false),
    Content(
        title: "플러터공부하기2",
        desc: "TodoApp",
        complete: false)
  ]),TodoList(date:"20230123",
  content:[Content(
  title:"플러터공부하기",
  desc:"getx공부",
  complete: false)]
  )];



  var todo = [
    {"date":"20230121",
    "content":[
      {"title":"플러터공부하기",
        "desc":"TodoApp공부",
        "complete":false},
      {"title":"gdgd",
        "desc":"@@@@",
        "complete":false}
    ]
  },{"date":"20230122",
      "content":[
    {"title":"gdgd",
      "desc":"@@@@",
      "complete":false}
  ]}
  ];

  @override
  void onInit() {
    super.onInit();
    todo = todo;
    showTitle();
    update();
  }
 void change(selectedDay, focusedDay){
    selectedDay1=selectedDay;
    focusedDay1=focusedDay;
    update();
  }
  void showTitle(){
    todo3=[];
    //DateFormat('yyyyMMdd').format(focusedDay1);
    for(var i in todo2){
        if(i.date==DateFormat('yyyyMMdd').format(focusedDay1)){
          for(var j in i.content){
            todo3.add(j.title);
          }
        }
    }
    print(todo3);
   update();
  }
  eventAdd(day){
    for(var i in todo2){
      if(DateFormat('yyyyMMdd').format(day)==i.date){
        return i.content;
      }
    }return [];

  }
}