import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/extension.dart';
import '../../../../../../core/helpers/spacer.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../logic/login_cubit.dart';
import '../../../logic/login_state.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is ForgotPasswordLoading ||
            current is ForgotPasswordSuccess ||
            current is ForgotPasswordFailure;
      },
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          const Center(
            child: CircularProgressIndicator(color: AppColors.mainRed),
          );
        } else if (state is ForgotPasswordSuccess) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4CAF50).withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // شريط علوي ملون
                    Container(
                      height: 4.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    // دائرة النجاح
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 72.w,
                          height: 72.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF4CAF50).withOpacity(0.1),
                          ),
                        ),
                        Container(
                          width: 56.w,
                          height: 56.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF4CAF50),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text(
                      'Email Sent Successfully',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      state.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF757575),
                        height: 1.4,
                      ),
                    ),
                    verticalSpace(24),
                    TextButton(
                      onPressed: () => context.pushNamedAndRemoveUntil(
                        Routes.login,
                        predicate: (route) => false,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF4CAF50),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ForgotPasswordFailure) {
          context.pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Container(),
    );
  }
}