import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar2/commons/collapsing_navigation_drawer_widget.dart';
import 'package:sidebar2/sidebar_controller.dart';

class PageWithSidebarButton extends StatelessWidget {
  final String title;
  final Widget pageContent;

  PageWithSidebarButton({required this.title, required this.pageContent});

  final SidebarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Row(
          children: [
            // Sidebar area
            if (!controller.isCollapsed.value)
              CollapsingNavigationDrawer(),

            // Main content area
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  leading: controller.isCollapsed.value
                      ? IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: controller.toggleSidebar,
                  )
                      : null,
                  title: Text(title),
                ),
                body: pageContent,
              ),
            ),
          ],
        );
      }),
    );
  }
}
