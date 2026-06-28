import 'package:flutter/material.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/widgets/custom_button.dart';

import '../../../core/networks/services/firebase/auth_services.dart';

class SettingsScreen extends StatelessWidget {
  final AuthServices authServices;
  const SettingsScreen({super.key, required this.authServices});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: CustomButton(
            text: "Log Out",
            onPressed: () {
              authServices.logout();
              // context.pushNamedAndRemoveUntil(Routes, predicate: predicate)
            }),
      ),
    );
  }
}
