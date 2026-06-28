import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_cubit.dart';

class SizeSelection extends StatefulWidget {
  const SizeSelection({super.key});

  @override
  State<SizeSelection> createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
              children: List.generate(
                context.read<HomeCubit>().sizes.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      context.read<HomeCubit>().selectedSize = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                        color: context.read<HomeCubit>().selectedSize == index
                            ? AppColors.mainRed
                            : Colors.white,
                        border:
                            Border.all(color: AppColors.mainRed, width: 1.5),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Text(
                      context.read<HomeCubit>().sizes[index],
                      style: context.read<HomeCubit>().selectedSize == index
                          ? AppTextStyles.font14SemiBoldWhite
                          : AppTextStyles.font14SemiBoldRed,
                    ),
                  ),
                ),
              ),
            );
  }
}