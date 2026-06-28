import 'package:freezed_annotation/freezed_annotation.dart';
import '../../home/data/models/products_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  // final int quantity = 1;
  const factory CartState.initial() = _Initial;
  const factory CartState.cartLoading() = CartLoading;
  const factory CartState.cartLoaded(List<ProductsModel> data) = CartLoaded;
  const factory CartState.cartError(String message) = CartError;

  // remove from cart states
  const factory CartState.cartItemRemoving() = CartItemRemoving;
  const factory CartState.cartItemRemoved(String message) = CartItemRemoved;
  const factory CartState.cartItemRemoveError(String message) = CartItemRemoveError;

  // update quantity states
  const factory CartState.cartQuantityIncreasing(int quantity) = CartQuantityIncreasing;
  const factory CartState.cartQuantityDecreasing(int quantity) = CartQuantityDecreasing;
}
