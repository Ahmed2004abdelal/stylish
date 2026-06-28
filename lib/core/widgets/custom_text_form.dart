import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validatorChecker;
  final TextInputType? keyboardType;
  const CustomTextForm({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.isObscureText,
    required this.validatorChecker,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: TextAlign.right,
      keyboardType: keyboardType,
      validator: validatorChecker,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      obscureText: isObscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        labelText: labelText,
        fillColor: Colors.grey.shade300,
        filled: true,
        prefixIcon: prefixIcon != null ? prefixIcon : null,
        suffixIcon: suffixIcon != null ? suffixIcon : null,
        hintText: hintText,
        hintStyle: AppTextStyles.font12MediumWhiteHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.green, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.grey, width: 1.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.grey, width: 1.5.w),
        ),
      ),
    );
  }
}
