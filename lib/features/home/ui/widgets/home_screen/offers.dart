import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/font_weight_helper.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/style.dart';

class Offers extends StatelessWidget {
  final String title;
  final Color color;
  const Offers({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.font20SemiBoldWhite,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 12,
                      color: Colors.white,
                    ),
                    horizontalSpace(4),
                    Text(
                      '22h 55m 20s remaining ',
                      style: AppTextStyles.font20SemiBoldWhite.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeightHelper.regular),
                    ),
                  ],
                )
              ],
            ),
            Container(
                alignment: Alignment.center,
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View All',
                      style: AppTextStyles.font20SemiBoldWhite
                          .copyWith(fontSize: 12.sp),
                    ),
                    horizontalSpace(8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    )
                  ],
                )),
          ],
        ));
  }
}
