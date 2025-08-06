import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar2/page_with_sidebar.dart';
import 'package:sidebar2/custom_navigation_drawer.dart'; // Assuming you still use drawerBackgroundColor etc.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // ✅ Replaced MaterialApp with GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Custom Navigation Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text("Gym App"),
      ),
      body: Stack(
        children: [
          Container(color: selectedColor),
          CollapsingNavigationDrawer(), // This will be updated to use GetX
        ],
      ),
    );
  }
}
