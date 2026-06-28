import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'core/networks/services/firebase/auth_services.dart';
import 'features/onboarding/ui/onboarding_screen.dart';
import 'bottom_nav_bar.dart';
import 'dimo_page.dart';

class LandingScreen extends StatelessWidget {
  final AuthServices authService;
  const LandingScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return OnboardingScreens();
          }
          return BottomNavBar();
        }
        // TODO: We will refactor this to make one component for loading
        return const DimoPage();
      },
    );
  }
}
