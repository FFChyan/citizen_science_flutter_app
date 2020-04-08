import 'package:flutter/material.dart';

class Task {
  final String name; // 项目名
  final String category; // 项目分类
  final String time; // 项目截止日期
  final Color color; // 项目标签颜色
  final bool completed; // 项目完成情况

  Task({this.name, this.category, this.time, this.color, this.completed});
}
  