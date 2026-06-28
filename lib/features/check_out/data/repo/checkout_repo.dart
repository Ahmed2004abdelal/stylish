import '../model/order_model.dart';


import '../../../../core/networks/services/firebase/auth_services.dart';
import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';
import '../../../profile/data/models/payment_model.dart';

class CheckoutRepo {
  final fireStoreService = FirestoreServices.instance;
  final AuthServices authServices;
  CheckoutRepo({required this.authServices});

  Stream<List<PaymentModel>> getAddress() {
    try {
      return fireStoreService.collectionsStream(
        path: FirebasePaths.userInformation(authServices.currentUser!.uid),
        builder: (data, docId) => PaymentModel.fromJson(data!),
      );
    } catch (e) {
      throw Exception('Failed to get profile info: $e');
    }
  }

  Future<void> makeOrder(OrderModel orderModel) async {
    try {
      await fireStoreService.setData(
        path: FirebasePaths.userOrderSet(
            authServices.currentUser!.uid, DateTime.now().toString()),
        data: orderModel.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAddress(PaymentModel paymentModel) async {
    try {
      await fireStoreService.setData(
        path: FirebasePaths.userInformationSet(authServices.currentUser!.uid),
        data: paymentModel.toJson()..removeWhere((key, value) => value == null),
      );
    } catch (e) {
      rethrow;
    }
  }
}
