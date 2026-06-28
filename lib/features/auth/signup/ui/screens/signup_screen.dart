import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/signup_bloc_listener.dart';

import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/widgets/create_account_text.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../login/ui/widgets/login_screen/or_continue_with.dart';
import '../../../login/ui/widgets/login_screen/social_media_icon.dart';
import '../../data/user_model.dart';
import '../../logic/signup_cubit.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupCubit _cubit;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignupCubit>();
    _formKey = _cubit.formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(top: 63.w, right: 32.h, left: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Create an\naccount'),
                verticalSpace(33),
                SignupForm(),
                verticalSpace(12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking the',
                        style: AppTextStyles.font12RegularGrey,
                      ),
                      TextSpan(
                        text: ' Register ',
                        style: AppTextStyles.font13Regularpink,
                      ),
                      TextSpan(
                        text: 'button, you agree \nto the public offer',
                        style: AppTextStyles.font12RegularGrey,
                      ),
                    ],
                  ),
                ),
                verticalSpace(30),
                CustomButton(
                  onPressed: () {
                    validateThenSignup(context);

                    // context.read<SignupCubit>().close();
                  },
                  text: 'Signup',
                ),
                verticalSpace(30),
                OrContinueWith(),
                verticalSpace(20),
                // social media icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaIcon(imagePath: "assets/images/google.png"),
                    horizontalSpace(10),
                    SocialMediaIcon(imagePath: "assets/images/apple.png"),
                    horizontalSpace(10),
                    SocialMediaIcon(imagePath: "assets/images/facebook.png"),
                  ],
                ),
                verticalSpace(20),
                CreateAccountText(
                  text: "Don't have an account?",
                  actionText: " Login",
                  onTap: () {
                    context.pushReplacementNamed(Routes.login);
                  },
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenSignup(BuildContext context) {
  final cubit = context.read<SignupCubit>();
  
  if (cubit.formKey.currentState!.validate()) {
    cubit.emitSignupLoading();
  }
}
