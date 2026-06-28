import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bottom_nav_bar.dart';
import '../networks/services/firebase/auth_services.dart';
import '../../features/check_out/logic/checkout_cubit.dart';
import '../../features/check_out/ui/check_out.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/cart/ui/cart_screen.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/home/logic/home/home_cubit.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/home/ui/screens/product_details.dart';
import '../../features/search/ui/search_screen.dart';
import '../../features/settting/ui/settings_screen.dart';
import '../../landing_screen.dart';

import '../../dimo_page.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/login/ui/screens/forgot_password.dart';
import '../../features/auth/login/ui/screens/login_screen.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/auth/signup/ui/screens/signup_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreens());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<HomeCubit>()..fetchHomeCategory(),
                  child: const HomeScreen(),
                ));
      case Routes.cart:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const CartScreen()));
      case Routes.settings:
        return MaterialPageRoute(
            builder: (context) =>
                SettingsScreen(authServices: getIt<AuthServices>()));
      case Routes.search:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<SearchCubit>(
                  create: (context) => getIt<SearchCubit>(),
                  child: SearchScreen(),
                ));
      case Routes.profile:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getUserInfo(),
                child: const ProfileScreen()));
      case Routes.landing:
        return MaterialPageRoute(
          builder: (context) => LandingScreen(authService: getIt()),
        );
      case Routes.productDetails:
        final product = settings.arguments as ProductsModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: ProductDetails(product: product)));
      case Routes.checkout:
        final cartItems = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<CheckoutCubit>()..getAddress(),
                  child: CheckOut(cartItems: cartItems),
                ));
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (context) => BottomNavBar());
      default:
        return MaterialPageRoute(builder: (context) => const DimoPage());
    }
  }
}
