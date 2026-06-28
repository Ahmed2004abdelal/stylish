import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/home/home_state.dart';
import 'product_slider.dart';
import '../home_screen/show_deal_of_the_day_products.dart';


class CustomDetailsButton extends StatelessWidget {
  final List<Color> gradientOne;
  final List<Color> gradientTwo;
  final Icon icon;
  final String text;
  void Function()? ontap;
  CustomDetailsButton(
      {super.key,
      required this.gradientOne,
      required this.gradientTwo,
      required this.ontap,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 150,
        height: 90,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            /// Main Button
            Positioned(
              left: 35,
              child: Container(
                width: 120.w,
                height: 45.h,
                padding: EdgeInsets.only(left: 25.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: gradientOne,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: AppTextStyles.font12RegularWhite
                      .copyWith(fontSize: 16.sp),
                  maxLines: 1,
                ),
              ),
            ),

            /// Floating Circle Icon
            Positioned(
              left: 10.w,
              child: Container(
                // padding: const EdgeInsets.all(8),
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: gradientTwo,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(2, 5),
                    ),
                  ],
                ),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}