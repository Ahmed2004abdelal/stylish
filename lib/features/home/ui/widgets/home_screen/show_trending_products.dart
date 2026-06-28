import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_products.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';
import '../../../data/models/products_model.dart';
import '../../../logic/home/home_cubit.dart';

import '../../../logic/home/home_state.dart';

class ShowTrendingProducts extends StatelessWidget {
  const ShowTrendingProducts({super.key});

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
                        .where((data) => data.isTrending)
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
                                    products: products,
                                  )
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


