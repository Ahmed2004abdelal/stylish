import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';
import '../../../home/data/models/products_model.dart';

abstract class SearchRepo {
  Future<List<ProductsModel>> searchProducts(String query);
  Future<List<ProductsModel>> searchWithinCategory(
      String category, String query);
}

class SearchRepoImpl implements SearchRepo {
  final FirestoreServices firestore;
  SearchRepoImpl({required this.firestore});

  @override
  Future<List<ProductsModel>> searchProducts(String query) async {
    try {
      final response = await firestore
          .collectionsStream(
            path: FirebasePaths.products(),
            builder: (data, docId) => ProductsModel.fromJson(data!),
          )
          .first;

      final filteredResponse = response.where((product) {
        final productName = product.name.toLowerCase();
        final searchQuery = query.toLowerCase();
        return productName.startsWith(searchQuery);
      }).toList();

      return filteredResponse;
    } catch (e) {
      throw Exception('Error searching products: $e');
    }
  }

  @override
  Future<List<ProductsModel>> searchWithinCategory(
      String category, String query) {
    // Implementation for searching within a specific category
    throw UnimplementedError();
  }
}
