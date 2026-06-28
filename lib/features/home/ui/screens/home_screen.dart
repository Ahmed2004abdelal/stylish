import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../widgets/home_screen/show_products.dart';
import '../widgets/home_screen/special_offers.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/products_model.dart';
import '../../logic/home/home_cubit.dart';
import '../../logic/home/home_state.dart';
import '../widgets/home_screen/offers.dart';
import '../widgets/home_screen/show_deal_of_the_day_products.dart';
import '../widgets/home_screen/show_trending_products.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style.dart';
import '../widgets/home_screen/cursor_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                // vertical: 16.0,
              ),
              child: Form(
                child: Column(children: [
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   width: 45,
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: AppColors.whiteTextField,
                      //   ),
                      //   child: const Icon(
                      //     Icons.menu,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      Row(
                        children: [
                          Image.asset('assets/images/logo.png',
                              width: 38, height: 31),
                          horizontalSpace(10),
                          Text(
                            'Stylish',
                            style: AppTextStyles.font18BoldBlue,
                          ),
                        ],
                      ),
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundColor: AppColors.whiteTextField,
                      //   child: const Icon(
                      //     Icons.account_circle_outlined,
                      //     color: Colors.black87,
                      //   ),
                      // )
                    ],
                  ),
                  // verticalSpace(16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'All Featured',
                  //       style: AppTextStyles.font18SemiBoldBlack,
                  //     ),
                  //   ],
                  // ),
                  // verticalSpace(17),
                  // CategoriesWithCubit(),
                  verticalSpace(16),
                  CursorSlider(),
                  verticalSpace(16),
                  Offers(title: 'Deal of the Day', color: AppColors.blue),
                  verticalSpace(16),
                  ShowDealOfTheDayProducts(),
                  verticalSpace(16),
                  SpecialOffers(),
                  verticalSpace(16),
                  Offers(
                    title: 'Trending Products ',
                    color: AppColors.mainRed,
                  ),
                  verticalSpace(16),
                  ShowTrendingProducts(),
                  verticalSpace(16),
                  Text(
                    'All Products',
                    style: AppTextStyles.font18SemiBoldBlack,
                  ),
                  verticalSpace(16),
                  ShowAllPoductsBlocBuilder(),
                  verticalSpace(200),
                ]),
              ),
            ),
          ),
        ));
  }
}

class ShowAllPoductsBlocBuilder extends StatelessWidget {
  const ShowAllPoductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.maybeWhen(
        homeProductLoading: () =>
            const Center(child: CircularProgressIndicator()),
        homeProductError: (message) => Center(child: Text(message)),
        homeProductSuccess: (data) {
          return StreamBuilder<List<ProductsModel>>(
            stream: data,
            builder: (context, snapshot) {
              final products = snapshot.data;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                ),
                itemCount: products?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = snapshot.data?[index];
                  if (product == null) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.productDetails,
                          arguments: product);
                    },
                    child: ShowProducts(
                      index: index,
                      products: snapshot.data!,
                    ),
                  );
                },
              );
            },
          );
        },
        orElse: () => const SizedBox.shrink(),
      );
    });
  }
}
