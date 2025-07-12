import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/auth/login_screen.dart';
import 'package:stylish_app/screens/onboarding/controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController onboardingController = Get.put(
    OnboardingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 17, right: 17, top: 1, bottom: 24),
          child: Column(
            children: [
              _buildTopSection(onboardingController, context),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: onboardingController.controller,
                  onPageChanged: (index) {
                    onboardingController.updateCurrentPage(index);
                  },
                  children: [chooseProduct(), makePayment(), getOrder()],
                ),
              ),
              _buildBottomSection(onboardingController, context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTopSection(
  OnboardingController onboardingController,
  BuildContext context,
) {
  return Obx(() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${onboardingController.currentPage.value + 1}/3'),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(AppText.skip),
        ),
      ],
    );
  });
}

Widget chooseProduct() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(AppImage.onboarding_1),
      Text('Choose Products'),
      Text(
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      ),
    ],
  );
}

Widget makePayment() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(AppImage.onboarding_2),
      Text('Make Payment'),
      Text(
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      ),
    ],
  );
}

Widget getOrder() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(AppImage.onboarding_3),
      Text('Get Your Order'),
      Text(
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      ),
    ],
  );
}

Widget _buildBottomSection(
  OnboardingController onboardingController,
  BuildContext context,
) {
  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        onboardingController.currentPage > 0
            ? TextButton(
              onPressed: onboardingController.previousPage,
              child: Text(AppText.prev),
            )
            : SizedBox(width: 60),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(3, (index) {
                  final isActive =
                      onboardingController.currentPage.value == index;
                  return AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: isActive ? 40 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isActive ? Colors.black : Colors.grey,
                    ),
                    duration: Duration(milliseconds: 500),
                  );
                }),
              ],
            ),
          ),
        ),
        onboardingController.currentPage >= 2
            ? TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(AppText.started),
            )
            : TextButton(
              onPressed: () {
                onboardingController.nextPage();
              },
              child: Text(AppText.next),
            ),
      ],
    ),
  );
}
