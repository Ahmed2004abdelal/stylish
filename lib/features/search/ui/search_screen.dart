import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/routing/routes.dart';
import '../logic/cubit/search_cubit.dart';
import '../logic/cubit/search_state.dart';
import 'widgets/search_bar.dart';

import '../../../core/helpers/spacer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(10),
                CustomSearchBar(
                  searchController:
                      context.read<SearchCubit>().searchController,
                  onChanged: (query) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    query.isNotEmpty
                        ? context.read<SearchCubit>().search(query)
                        : context
                            .read<SearchCubit>()
                            .emit(SearchState.initial());
                  },
                ),
                verticalSpace(17),
                SearchBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (message) => Center(
                  child: Text(message),
                ),
            success: (data) {
              return Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.productDetails,
                              arguments: product);
                        },
                        child: ListTile(
                          title: Text(product.name),
                          // subtitle: Text('\$${product.price}'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            orElse: () => const Center(
                  child: Text('Search for products'),
                ));
      },
    );
  }
}
