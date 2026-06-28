import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';

class SocialMediaIcon extends StatelessWidget {
  final String imagePath;
  const SocialMediaIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Implement Facebook login functionality
      },
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: AppColors.mainRed, width: 1.5.w),
        ),
        child: Image.asset(imagePath, width: 24.w, height: 24.h),
      ),
    );
  }
}
