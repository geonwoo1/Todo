import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/TodoList.dart';

class TodoController extends GetxController {
  DateTime focusedDay1 = DateTime.now();
  DateTime selectedDay1 = DateTime.now();

  //날짜 선택시 할일, 완료한일 표시하기위한 배열 생성
  var titleArr = [];
  var completedArr = [];
  var list =[];
  var _cnt = 0;

  // todolist 하드코딩 => DB에 저장?
  var todo2 = [
    TodoList(date: "20230123", content: [
      Content(title: "플러터공부하기", desc: "getx공부", complete: false),
      Content(title: "플러터공부하기2", desc: "TodoApp", complete: false),
      Content(title: "플러터공부하기3", desc: "getx공부", complete: false),
    ]),
    TodoList(
        date: "20230125",
        content: [Content(title: "플러터공부하기", desc: "getx공부", complete: false)])
  ];

  @override
  // 컨트롤러 불러올때 한 번 실행
  void onInit() {
    super.onInit();
    todo2 = todo2;
    firstPageView();
    update();
  }

  // 사용자가 달력 클릭시 불러올 함수 => 달력에 포커스 바꿔준다.
  void change(selectedDay, focusedDay) {
    _cnt = 0;
    selectedDay1 = selectedDay;
    focusedDay1 = focusedDay;
    titleArr = [];
    completedArr = [];
    for (var i in todo2) {
      if (DateFormat('yyyyMMdd').format(focusedDay) == i.date) {
        for (var j in i.content) {
          _cnt;
          j.complete == false
              ? titleArr.add(
              {"title": j.title,
                "complted": false,
                "desc":j.desc,
                "index": _cnt

              })
              : completedArr.add(
              {"title": j.title,
                "complted": true,
                "desc":j.desc,
                "index": _cnt
                });
          _cnt += 1;
        }
      }
    }
    update();
  }

  // 이벤트가 있는 날짜에 마커 표시 => i.content 길이만큼 빨간점 생성
  eventAdd(day) {
    for (var i in todo2) {
      if (DateFormat('yyyyMMdd').format(day) == i.date) {
        return i.content;
      }
    }
    return [];
  }
  //체크박스 클릭시 완료 리스트로 이동
  void todoComplted(value,idx) {
    for (var i in todo2) {
      if (DateFormat('yyyyMMdd').format(focusedDay1) == i.date) {
        i.content[idx].complete =value;
      }
    }
    value == true ? value = false : value = true;
    update();
  }

  void firstPageView(){
    for(var i in todo2){
      int a = int.parse(i.date.substring(0,4));
      int b = int.parse(i.date.substring(4,6));
      int c = int.parse(i.date.substring(6,8));
      DateTime now = DateTime.now();
      DateTime listTime = DateTime.utc(a,b,c);
      listTime.isAfter(now) && listTime.isBefore(now.add(const Duration(days:7))) ?
          list.add(i) : "";

    }
    print(list[0].content.length);
  }
}