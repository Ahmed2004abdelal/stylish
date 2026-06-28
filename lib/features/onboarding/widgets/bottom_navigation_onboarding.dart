import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/helpers/extension.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/style.dart';

class BottomNavigationOnboard extends StatelessWidget {
  const BottomNavigationOnboard({
    super.key,
    required this.currentPage,
    required this.controller,
  });

  final int currentPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.h,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ✅ Prev Button
            currentPage == 0
                ? const SizedBox(width: 50)
                : TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Prev',
                      style: AppTextStyles.font18SemiBoldGrey,
                    ),
                  ),
            // ✅ Page Indicator
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 40.w,
                  height: 8.h,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                dotDecoration: DotDecoration(
                  width: 10.w,
                  height: 10.h,
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (currentPage == 2) {
                  context.pushNamedAndRemoveUntil(Routes.login,
                      predicate: (route) => false);
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                currentPage == 2 ? 'Get Started' : 'Next',
                style: AppTextStyles.font18SemiBoldRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
