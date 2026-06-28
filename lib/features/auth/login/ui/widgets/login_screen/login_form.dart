import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/spacer.dart';
import '../../../../../../core/widgets/custom_text_form.dart';
import '../../../logic/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginCubit _cubit;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool isPasswordObscureText = true;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<LoginCubit>();
    emailController = _cubit.emailController;
    passwordController = _cubit.passwordController;
    emailFocusNode = _cubit.emailFocusNode;
    passwordFocusNode = _cubit.passwordFocusNode;
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          focusNode: emailFocusNode,
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          controller: emailController,
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          isObscureText: false,
        ),
        verticalSpace(31),
        CustomTextForm(
          focusNode: passwordFocusNode,
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          controller: passwordController,
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          isObscureText: isPasswordObscureText,
          suffixIcon: GestureDetector(
            onTap: () =>
                setState(() => isPasswordObscureText = !isPasswordObscureText),
            child: Icon(
              isPasswordObscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ],
    );
  }
}
