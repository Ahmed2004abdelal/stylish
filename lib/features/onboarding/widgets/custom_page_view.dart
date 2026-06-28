import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extension.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/style.dart';

class CustomPageView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final PageController controller;
  final int pageNumber; // ✅ أضف رقم الصفحة

  const CustomPageView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 17.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ✅ عرض رقم الصفحة الحالية
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$pageNumber',
                      style: AppTextStyles.font18SemiBoldBlack,
                    ),
                    TextSpan(
                      text: '/3',
                      style: AppTextStyles.font18SemiBoldGrey,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.login,
                    predicate: (route) => false,
                  );
                },
                child: Text('Skip', style: AppTextStyles.font18SemiBoldBlack),
              ),
            ],
          ),
          verticalSpace(110),
          Image.asset(imagePath, width: 300.w, height: 300.h),
          verticalSpace(15),
          Text(title, style: AppTextStyles.font24ExtraBoldBlack),
          verticalSpace(10),
          Text(
            subtitle,
            style: AppTextStyles.font14SemiBoldWhiteGrey.copyWith(height: 1.7),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
