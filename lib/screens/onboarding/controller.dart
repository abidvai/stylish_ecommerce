
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController controller = PageController();

  RxInt currentPage = 0.obs;

  void updateCurrentPage(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage++;
      controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linearToEaseOut);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage--;
      controller.previousPage(duration: Duration(milliseconds: 200), curve: Curves.linearToEaseOut);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}