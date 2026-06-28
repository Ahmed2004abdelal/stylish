import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'show_products.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../data/models/products_model.dart';
import '../../../logic/home/home_cubit.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_state.dart';

class ShowDealOfTheDayProducts extends StatelessWidget {
  const ShowDealOfTheDayProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.maybeWhen(
          homeProductLoading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          homeProductSuccess: (data) {
            return StreamBuilder<List<ProductsModel>>(
                stream: data,
                builder: (context, snapchot) {
                  if (snapchot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapchot.hasError) {
                    return Text('Error: ${snapchot.error}');
                  } else if (snapchot.hasData) {
                    final products = snapchot.data!
                        .where((data) => data.isDealOfTheDay)
                        .toList();

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            products.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    context.pushNamed(Routes.productDetails,
                                        arguments: products[index]);
                                  },
                                  child: ShowProducts(
                                    index: index,
                                    products: products),
                                )),
                      ),
                    );
                  } else {
                    return const Text('No products found');
                  }
                });
          },
          homeProductError: (message) => Text(message),
          orElse: () => SizedBox.shrink());
    });
  }
}



class RatingBar extends StatelessWidget {
  final ProductsModel products;
  const RatingBar({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: products.rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 15.0,
          direction: Axis.horizontal,
        ),
        horizontalSpace(5),
        Text(
          products.reviewCount.toString(),
          style: AppTextStyles.font12RegularGrey,
        )
      ],
    );
  }
}
