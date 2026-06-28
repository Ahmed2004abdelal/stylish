import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/products_model.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  //! Home Category State
  const factory HomeState.homeCategoryLoading() = HomeCategoryLoading;
  const factory HomeState.homeCategorySuccess(T data) = HomeCategorySuccess;
  const factory HomeState.homeCategoryError(String message) = HomeCategoryError;

  //! Home Product State
  const factory HomeState.homeProductLoading() = HomeProductLoading;
  const factory HomeState.homeProductSuccess(Stream<List<ProductsModel>> data) = HomeProductSuccess;
  const factory HomeState.homeProductError(String message) = HomeProductError;

  //! Add To Cart State
  const factory HomeState.addToCartLoading() = AddToCartLoading;
  const factory HomeState.addToCartSuccess(String message) = AddToCartSuccess;
  const factory HomeState.addToCartError(String message) = AddToCartError;
}
