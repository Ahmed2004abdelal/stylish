import '../../../home/data/models/products_model.dart';

import '../../../../core/networks/services/firebase/auth_services.dart';
import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';

abstract class CartRepo {
  Stream<List<ProductsModel>> getCartItems();
  Future<void> removeFromCart(String productId);
}

class CartRepoImpl implements CartRepo {
  final AuthServices _authServices;
  final FirestoreServices _firestoreServices;
  CartRepoImpl(this._firestoreServices, {required AuthServices authServices})
      : _authServices = authServices;

  @override
  Stream<List<ProductsModel>> getCartItems() {
    try {
      return _firestoreServices.collectionsStream(
        path: FirebasePaths.getCart(_authServices.currentUser?.uid ?? ''),
        builder: (data, docId) => ProductsModel.fromJson(data!),
      );
    } catch (e) {
      throw Exception('Failed to fetch cart items: $e');
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    try {
      // final uid = _firestoreServices.deleteData(path: FirebasePaths.cart(uid, cartId));

      await _firestoreServices.deleteData(
        path: FirebasePaths.cart(_authServices.currentUser?.uid ?? '', productId),
      );
    } catch (e) {
      throw Exception('Failed to remove item: $e');
    }
  }
}
