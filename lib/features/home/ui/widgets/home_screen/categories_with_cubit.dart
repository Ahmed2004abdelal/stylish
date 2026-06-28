import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cat_model.dart';
import '../../../logic/home/home_cubit.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_state.dart';

class CategoriesWithCubit extends StatelessWidget {
  const CategoriesWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current.maybeWhen(
        homeCategoryLoading: () => true,
        homeCategorySuccess: (data) => true,
        homeCategoryError: (message) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          homeCategoryLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          homeCategorySuccess: (data) {
            return SizedBox(
              height: 100,
              child: StreamBuilder<List<CategoriesModel>>(
                stream: data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final categories = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteTextField,
                                ),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    category.image ??
                                        'assets/images/onboarding-1.png'),
                              ),
                              verticalSpace(8),
                              Text(
                                category.name ?? 'Category',
                                style: AppTextStyles.font12MediumBlackGrey,
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text('No categories found');
                  }
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}