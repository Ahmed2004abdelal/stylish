import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/login_cubit.dart';

import '../../../../../../core/helpers/extension.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        state.maybeWhen(
            loginLoading: () => Center(child: CircularProgressIndicator()),
            loginSuccess: () => context.pushNamedAndRemoveUntil(
                Routes.bottomNavBar,
                predicate: (route) => false),
            loginFailure: (message) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () => SizedBox.shrink());
        // if (state is LoginLoading) {
        //   showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (context) =>
        //         const Center(child: CircularProgressIndicator()),
        //   );
        // } else if (state is LoginSuccess) {
        //   context.pushNamedAndRemoveUntil(Routes.bottomNavBar,
        //       predicate: (route) => false);
        // } else if (state is LoginFailure) {
        //   Navigator.of(context).pop();
        //   ScaffoldMessenger.of(
        //     context,
        //   ).showSnackBar(SnackBar(content: Text(state.message)));
        // }
      },
      child: Container(),
    );
  }
}
