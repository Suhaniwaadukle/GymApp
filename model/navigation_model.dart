import 'package:flutter/material.dart';
class NavigationModel {
  final String title;
  final IconData icon;
  NavigationModel({required this.title, required this.icon});
}
List<NavigationModel> navigationItems = [
  NavigationModel(title: "Attendance", icon: Icons.insert_chart),
  NavigationModel(title: "Live Contest", icon: Icons.live_tv),
  NavigationModel(title: "Set goal", icon: Icons.access_time),
  NavigationModel(title: "Total member", icon: Icons.task_alt),
  NavigationModel(title: "Show product", icon: Icons.show_chart),
  NavigationModel(title: "Mark atte",icon: Icons.mark_chat_read_outlined),
  NavigationModel(title: "Favorite fr", icon: Icons.account_circle_sharp),
  NavigationModel(title: "Device safety", icon: Icons.safety_check),
  NavigationModel(title: "Women safety", icon: Icons.woman),
  NavigationModel(title: "Gym feedback", icon: Icons.feedback),
  NavigationModel(title: "Gym approach", icon: Icons.ad_units),
  NavigationModel(title: "Personal trainers", icon: Icons.model_training),
  NavigationModel(title: "Personal training", icon: Icons.person_pin_rounded),
];
