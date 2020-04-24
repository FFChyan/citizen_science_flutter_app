import 'package:citizen_science/utils/task.dart';
import 'package:flutter/material.dart';

List<Task> tasks = [
  new Task(
      name: "寻找布谷鸟",
      category: "鸟类 / 照片采集 / 分布统计",
      time: "2020 / 7 / 1",
      color: Colors.orange,
      completed: false,
      newDataNum: 23),
  new Task(
      name: "咪咪我们的朋友",
      category: "布偶猫 / 照片采集",
      time: "2021 / 10 / 31",
      color: Colors.cyan,
      completed: true,
      newDataNum: 18),
  new Task(
      name: "下一颗脉冲星等你来发现",
      category: "天文 / 图像标注",
      time: "2021 / 2 / 1",
      color: Colors.pink,
      completed: false,
      newDataNum: 43),
  new Task(
      name: "斑点蝶比美大赛",
      category: "蝶类 / 照片采集 / 分布统计",
      time: "2022 / 6 / 30",
      color: Colors.cyan,
      completed: true,
      newDataNum: 21),
  new Task(
      name: "黄芩比黄大赛",
      category: "双子叶植物 / 照片采集 / 分布统计",
      time: "2023 / 7 / 31",
      color: Colors.cyan,
      completed: true,
      newDataNum: 9),
];
