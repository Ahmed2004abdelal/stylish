import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_onboarding.dart';
import '../widgets/custom_page_view.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late PageController controller;
  int currentPage = 0; // ✅ استخدم int بدل double

  @override
  void initState() {
    super.initState();
    controller = PageController();
    // ✅ أضف listener لتحديث الصفحة الحالية
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              CustomPageView(
                imagePath: 'assets/images/onboarding-1.png',
                title: 'Find Your Style',
                subtitle:
                    'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
                controller: controller,
                pageNumber: 1,
              ),
              CustomPageView(
                imagePath: 'assets/images/onboarding-2.png',
                title: 'Explore New Trends',
                subtitle:
                    'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
                controller: controller,
                pageNumber: 2,
              ),
              CustomPageView(
                imagePath: 'assets/images/onboarding-3.png',
                title: 'Shop with Confidence',
                subtitle:
                    'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
                controller: controller,
                pageNumber: 3,
              ),
            ],
          ),
          // ✅ Bottom Navigation Bar
          BottomNavigationOnboard(
            currentPage: currentPage,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
