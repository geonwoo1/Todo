import 'dart:convert';

import 'dart:convert';

List<TodoList> todoListFromJson(String str) => List<TodoList>.from(json.decode(str).map((x) => TodoList.fromJson(x)));

String todoListToJson(List<TodoList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoList {
  TodoList({
    required this.date,
    required this.content,
  });

  String date;
  List<Content> content;

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
    date: json["date"],
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class Content {
  Content({
    required this.title,
    required this.desc,
    required this.complete,
    required this.important,
  });

  String title;
  String desc;
  bool complete;
  bool important;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    title: json["title"],
    desc: json["desc"],
    complete: json["complete"],
    important: json["important"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "desc": desc,
    "complete": complete,
    "important" : important,
  };
}