import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar2/sidebar_controller.dart';
import 'package:sidebar2/model/navigation_model.dart';
import 'package:sidebar2/page_with_sidebar.dart';
import 'package:sidebar2/section/attendance.dart';
import 'package:sidebar2/section/device_saf.dart';
import 'package:sidebar2/section/fav_frnd.dart';
import 'package:sidebar2/section/gym_approach.dart';
import 'package:sidebar2/section/gym_feedback.dart';
import 'package:sidebar2/section/livecontest.dart';
import 'package:sidebar2/section/mark_att.dart';
import 'package:sidebar2/section/personal_trainers.dart';
import 'package:sidebar2/section/personal_training.dart';
import 'package:sidebar2/section/set_goal.dart';
import 'package:sidebar2/section/show_product.dart';
import 'package:sidebar2/section/total_member.dart';
import 'package:sidebar2/section/women_saf.dart';
import '../custom_navigation_drawer.dart';
import 'package:sidebar2/commons/collapsing_list_tile_widget.dart';

class CollapsingNavigationDrawer extends StatelessWidget {
  final SidebarController controller = Get.put(SidebarController());

  final double maxWidth = 210;
  final double minWidth = 70;

  final Map<int, Widget Function()> pageMap = {
    0: () => AttendancePage(),
    1: () => LiveContestPage(),
    2: () => SetGoalPage(),
    3: () => TotalMemberPage(),
    4: () => ShowProductPage(),
    5: () => MarkAttPage(),
    6: () => FavFrndPage(),
    7: () => DeviceSafPage(),
    8: () => WomenSafPage(),
    9: () => GymFeedbackPage(),
    10: () => GymApproachPage(),
    11: () => PersonalTrainersPage(),
    12: () => PersonalTrainingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          // Expanded Sidebar
          if (!controller.isCollapsed.value)
            Container(
              width: maxWidth,
              color: drawerBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CollapsingListTile(
                    title: 'IITS',
                    icon: Icons.person,
                    animationController: AlwaysStoppedAnimation<double> (0.0),
                  ),
                  const Divider(color: Colors.grey, height: 40.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(navigationItems.length, (index) {
                          return Column(
                            children: [
                              CollapsingListTile(
                                onTap: () {
                                  controller.selectPage(index);
                                  var pageBuilder = pageMap[index];
                                  if (pageBuilder != null) {
                                    Get.off(() => pageMap[index]);
                                  }
                                },
                                isSelected:
                                controller.currentSelectedIndex.value ==
                                    index,
                                title: navigationItems[index].title,
                                icon: navigationItems[index].icon,
                                animationController:
                                AlwaysStoppedAnimation(0), // no animation now
                              ),
                              const Divider(height: 12.0),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.toggleSidebar,
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: selectedColor,
                        size: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),

          // Collapsed Button (Menu Icon)
          if (controller.isCollapsed.value)
            Positioned(
              top: 40,
              left: 10,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.white.withOpacity(0.8),
                  child: InkWell(
                    onTap: controller.toggleSidebar,
                    child: const Icon(Icons.menu, size: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
