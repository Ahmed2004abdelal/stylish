import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/colors.dart';
import 'core/di/dependency_injection.dart';

import 'features/cart/logic/cart_cubit.dart';
import 'features/cart/ui/cart_screen.dart';

import 'features/home/logic/home/home_cubit.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/profile/logic/profile_cubit.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'features/profile/ui/profile_screen.dart';
import 'features/search/logic/cubit/search_cubit.dart';
import 'features/search/ui/search_screen.dart';
import 'features/settting/ui/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      BlocProvider(
        create: (context) => getIt<HomeCubit>()
          ..fetchHomeCategory()
          ..fetchHomeproducts(),
        child: const HomeScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<CartCubit>()..syncWithFirestore(),
        child: const CartScreen(),
      ),
      BlocProvider(
          create: (context) => getIt<ProfileCubit>()..getUserInfo(),
          child: const ProfileScreen()),
      BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: SearchScreen(),
      ),
      SettingsScreen(
        authServices: getIt(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        // ✅ بيخلي كل الصفحات موجودة في الـ tree
        index: _currentIndex,
        children: _pages,
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 70.h,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: AppColors.mainRed,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home,
              size: 32,
              color: _currentIndex == 0 ? Colors.white : Colors.black,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: _currentIndex == 1 ? Colors.white : Colors.black,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person,
              size: 28,
              color: _currentIndex == 2 ? Colors.white : Colors.black,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.search,
              size: 28,
              color: _currentIndex == 3 ? Colors.white : Colors.black,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.settings,
              size: 28,
              color: _currentIndex == 4 ? Colors.white : Colors.black,
            ),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
