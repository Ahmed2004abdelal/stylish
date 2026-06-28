import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/login_cubit.dart';
import '../widgets/login_screen/login_bloc_listener.dart';
import '../widgets/login_screen/login_form.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/widgets/create_account_text.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../widgets/login_screen/or_continue_with.dart';
import '../widgets/login_screen/social_media_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _cubit;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _cubit = context.read<LoginCubit>();
    _formKey = _cubit.formKey;
    super.initState();
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
                CustomAppBar(title: 'Welcome\nBack!'),
                verticalSpace(36),
                LoginForm(),
                verticalSpace(9),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.forgotPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.font14RegularRed,
                    ),
                  ),
                ),
                verticalSpace(52),
                CustomButton(
                  onPressed: () {
                    validateAndLogin(context);
                  },
                  text: 'Login',
                ),
                verticalSpace(75),
                OrContinueWith(),
                verticalSpace(20),
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
                verticalSpace(30),
                CreateAccountText(
                  text: "Don't have an account?",
                  actionText: "Sign Up",
                  onTap: () {
                    context.pushReplacementNamed(Routes.signup);
                  },
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateAndLogin(BuildContext context) {
  final formKey = context.read<LoginCubit>().formKey;
  debugPrint('user Id: ${context.read<LoginCubit>().userId}');
  if (formKey.currentState?.validate() ?? false) {
    context.read<LoginCubit>().emitLoginLoading();
  }
}
