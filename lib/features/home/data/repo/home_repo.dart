
import '../../../../core/networks/services/firebase/auth_services.dart';
import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';
import '../models/cat_model.dart';
import '../models/products_model.dart';



abstract class HomeRepo {
  Stream<List<CategoriesModel>> fetchHomeCategory();
  Stream<List<ProductsModel>> fetchHomeproducts();
  Future<void> addToCart(ProductsModel product);
  // Future<String> getUid();
}

class HomeRepoImpl implements HomeRepo {
  final AuthServices _authServices;
  final FirestoreServices _firestoreServices;
  HomeRepoImpl(this._firestoreServices, {required AuthServices authServices}) : _authServices = authServices;

  @override
  Stream<List<CategoriesModel>> fetchHomeCategory() {
    return _firestoreServices.collectionsStream(
      path: FirebasePaths.categories(),
      builder: (data, docId) => CategoriesModel.fromJson(data!),
    );
  }

  @override
  Stream<List<ProductsModel>> fetchHomeproducts() {
    return _firestoreServices.collectionsStream(
        path: FirebasePaths.products(),
        builder: (data, docId) => ProductsModel.fromJson(data!));
  }

  @override
  Future<void> addToCart(ProductsModel product) async =>
      _firestoreServices.setData(
        path: FirebasePaths.cart(await _authServices.currentUser?.uid ??' ', product.id),
        data: product.toJson(),
      );


}