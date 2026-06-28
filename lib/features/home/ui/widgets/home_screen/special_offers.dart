
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/style.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 70.h,
                    width: double.infinity,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          fit: BoxFit.cover,
                          'assets/images/offer.png',
                          width: 60.w,
                          height: 55.h,
                        ),
                        horizontalSpace(40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Offer',
                              style: AppTextStyles.font18SemiBoldBlack,
                            ),
                            Text(
                              'We make sure you get the\noffer you need at best prices',
                              style: AppTextStyles.font12MediumBlackGrey,
                            )
                          ],
                        )
                      ],
                    ),
                  );
  }
}