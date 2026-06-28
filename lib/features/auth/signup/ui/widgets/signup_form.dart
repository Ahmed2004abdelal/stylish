import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/widgets/custom_text_form.dart';
import '../../logic/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late final SignupCubit _cubit;
  late final TextEditingController _emailController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignupCubit>();
    _emailController = _cubit.emailController;
    _usernameController = _cubit.usernameController;
    _passwordController = _cubit.passwordController;
    _confirmPasswordController = _cubit.confirmpasswordController;
    _emailFocusNode = _cubit.emailFocusNode;
    _usernameFocusNode = _cubit.usernameFocusNode;
    _passwordFocusNode = _cubit.passwordFocusNode;
    _confirmPasswordFocusNode = _cubit.confirmpasswordFocusNode;
  }

  // dispose() {
  //   _emailController.dispose();
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   _confirmPasswordController.dispose();
  //   _emailFocusNode.dispose();
  //   _usernameFocusNode.dispose();
  //   _passwordFocusNode.dispose();
  //   _confirmPasswordFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            // Simple email validation
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          focusNode: _emailFocusNode,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(_usernameFocusNode),
          controller: _emailController,
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),

          // isObscureText: false,
        ),
        verticalSpace(25),
        CustomTextForm(
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
          focusNode: _usernameFocusNode,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(_passwordFocusNode),
          controller: _usernameController,
          hintText: 'Username',
          prefixIcon: Icon(Icons.person),
          // isObscureText: false,
        ),
        verticalSpace(25),
        CustomTextForm(
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
              return 'Please enter a valid password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
          focusNode: _passwordFocusNode,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
          controller: _passwordController,
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
        verticalSpace(25),
        CustomTextForm(
          validatorChecker: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != context.read<SignupCubit>().passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          controller: _confirmPasswordController,
          hintText: 'Confirm Password',
          prefixIcon: Icon(Icons.lock),
          isObscureText: isPasswordConfirmationObscureText,
          suffixIcon: GestureDetector(
            onTap: () => setState(
              () => isPasswordConfirmationObscureText =
                  !isPasswordConfirmationObscureText,
            ),
            child: Icon(
              isPasswordConfirmationObscureText
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
      ],
    );
  }
}
