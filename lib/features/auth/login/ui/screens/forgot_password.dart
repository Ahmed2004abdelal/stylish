import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/login_cubit.dart';
import '../widgets/forgot_password/forgot_password_bloc_listener.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late LoginCubit _cubit;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;

  @override
  initState() {
    _cubit = context.read<LoginCubit>();
    _formKey = _cubit.formKey;
    _emailController = _cubit.emailController;
    super.initState();
  }

  @override
  dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 63.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Forgot\nPassword?'),
                verticalSpace(36),
                CustomTextForm(
                  validatorChecker: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  hintText: 'Enter your Email Address',
                  prefixIcon: Icon(Icons.email),
                  isObscureText: false,
                ),

                verticalSpace(26),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: AppTextStyles.font13Regularpink,
                      ),
                      TextSpan(
                        text:
                            'We will send you a message to set or reset\nyour new password',
                        style: AppTextStyles.font12RegularGrey,
                      ),
                    ],
                  ),
                ),
                verticalSpace(26),
                CustomButton(
                  onPressed: () {
                    validateAndForgotPassword(context);
                  },
                  text: 'Submit',
                ),
                const ForgotPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



void validateAndForgotPassword(BuildContext context) {
  final formKey = context.read<LoginCubit>().formKey;
  if (formKey.currentState?.validate() ?? false) {
    context.read<LoginCubit>().emitForgotPassword();
  }
}
