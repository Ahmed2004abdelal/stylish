import 'package:bloc/bloc.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../data/repo/cart_repo.dart';
import 'cart_state.dart';
import '../../home/data/models/products_model.dart';

// ✅ ثابت للـ key عشان منكتبوش أكثر من مرة
const String _cartCacheKey = 'cached_cart_items';

class CartCubit extends Cubit<CartState> {
  List<ProductsModel> cartItems = [];
  final CartRepoImpl cartRepoImpl;

  CartCubit(this.cartRepoImpl) : super(CartState.initial());

  void fetchCartItems() async {
    await _loadFromLocal();

    syncWithFirestore();
  }

  Future<void> _loadFromLocal() async {
    final cached = await SharedPrefHelper.getJsonList(_cartCacheKey);

    if (cached != null && cached.isNotEmpty) {
      cartItems = cached.map((e) => ProductsModel.fromJson(e)).toList();
      emit(CartState.cartLoaded(List.from(cartItems)));
    } else {
      emit(CartState.cartLoading());
    }
  }

  Future<void> syncWithFirestore() async {
    try {
      final stream = cartRepoImpl.getCartItems();
      final freshData = await stream.first;

      cartItems = freshData.map((freshItem) {
        final localItem = cartItems.firstWhere(
          (local) => local.id == freshItem.id,
          orElse: () => freshItem,
        );
        return freshItem.copyWith(quantity: localItem.quantity);
      }).toList();

      await _saveToLocal();
      emit(CartState.cartLoaded(List.from(cartItems)));
    } catch (e) {
      if (cartItems.isEmpty) {
        emit(CartState.cartError(e.toString()));
      }
    }
  }

  Future<void> _saveToLocal() async {
    final jsonList = cartItems.map((e) => e.toJson()).toList();
    await SharedPrefHelper.setJsonList(_cartCacheKey, jsonList);
  }

  void addQuantity(int index) {
    final updatedItems = List<ProductsModel>.from(cartItems);
    updatedItems[index] = updatedItems[index].copyWith(
      quantity: updatedItems[index].quantity + 1,
    );
    cartItems = updatedItems;
    _saveToLocal();
    emit(CartState.cartLoaded(List.from(cartItems)));
  }

  void removeQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      final updatedItems = List<ProductsModel>.from(cartItems);
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity - 1,
      );
      cartItems = updatedItems;
      _saveToLocal();
      emit(CartState.cartLoaded(List.from(cartItems)));
    }
  }

  void removeFromCart(String productId) async {
    emit(CartState.cartItemRemoving());
    try {
      await cartRepoImpl.removeFromCart(productId);
      cartItems.removeWhere((item) => item.id == productId);
      await _saveToLocal();
      emit(CartState.cartItemRemoved('Item removed from cart'));
    } catch (e) {
      emit(CartState.cartItemRemoveError('Failed to remove item from cart'));
    }
  }

  Future<void> clearCart() async {
    cartItems = [];
    await SharedPrefHelper.removeData(_cartCacheKey);
    emit(CartState.initial());
  }
}
