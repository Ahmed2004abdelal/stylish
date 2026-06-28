import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../networks/services/firebase/auth_services.dart';
import '../networks/services/firebase/firestore_services.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../../features/check_out/data/repo/checkout_repo.dart';
import '../../features/check_out/logic/checkout_cubit.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/settting/ui/settings_screen.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/home/home_cubit.dart';
import '../../landing_screen.dart';

import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final StripeServices stripeServices = StripeServices.instance;

  final FirestoreServices firestoreServices = FirestoreServices.instance;

  //auth
  getIt.registerLazySingleton<AuthServices>(
    () => AuthServices(
      firebaseAuth: firebaseAuth,
    ),
  );

  getIt.registerLazySingleton<FirestoreServices>(
    () => firestoreServices,
  );

  getIt.registerLazySingleton<LandingScreen>(
    () => LandingScreen(authService: getIt()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt()),
  );

  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt<FirestoreServices>(),
      getIt<AuthServices>(),
    ),
  );

  //home
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt<FirestoreServices>(),
        authServices: getIt<AuthServices>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(homeRepoImpl: getIt<HomeRepoImpl>()),
  );

  //cart
  getIt.registerLazySingleton<CartRepoImpl>(
    () => CartRepoImpl(getIt<FirestoreServices>(),
        authServices: getIt<AuthServices>()),
  );
  getIt.registerFactory<CartCubit>(
    () => CartCubit(getIt<CartRepoImpl>()),
  );

  //profile
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(
        authServices: getIt<AuthServices>(),
        firestoreServices: getIt<FirestoreServices>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(profileRepoImpl: getIt<ProfileRepoImpl>()),
  );
  getIt.registerLazySingleton<SettingsScreen>(
    () => SettingsScreen(authServices: getIt<AuthServices>()),
  );

  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepo(
      authServices: getIt<AuthServices>(),
    ),
  );
  getIt.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(
      checkoutRepo: getIt<CheckoutRepo>(),
      // stripe: getIt<StripeServices>(),
    ),
  );

  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(
      firestore: getIt<FirestoreServices>(),
    ),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      searchRepoImpl: getIt<SearchRepoImpl>(),
    ),
  );
}
