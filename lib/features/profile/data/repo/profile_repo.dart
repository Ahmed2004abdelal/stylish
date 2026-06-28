
import '../models/payment_model.dart';

import '../../../../core/networks/services/firebase/auth_services.dart';
import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';

abstract class ProfileRepo {
  Future<void> updateProfile(PaymentModel paymentModel);
  Stream<List<PaymentModel>> getProfileInfo();
}

class ProfileRepoImpl extends ProfileRepo {
  final AuthServices authServices;
  final FirestoreServices firestoreServices;

  ProfileRepoImpl(
      {required this.authServices, required this.firestoreServices});

  @override
  Future<void> updateProfile(PaymentModel paymentModel) async {
    try {
      await firestoreServices.setData(
        path: FirebasePaths.userInformationSet(authServices.currentUser!.uid),
        data: paymentModel.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  @override
  Stream<List<PaymentModel>> getProfileInfo() {
    try {
      return firestoreServices.collectionsStream(
        path: FirebasePaths.userInformation(authServices.currentUser!.uid),
        builder: (data, docId) => PaymentModel.fromJson(data!),
      );
    } catch (e) {
      throw Exception('Failed to get profile info: $e');
    }
  }
}
