import 'package:get/get.dart';
class SidebarController extends GetxController {
  var isCollapsed = true.obs;
  var currentSelectedIndex = 0.obs;
  void toggleSidebar() {
    isCollapsed.value = !isCollapsed.value;
  }
  void selectPage(int index) {
    currentSelectedIndex.value = index;
    isCollapsed.value = true;
  }
}
