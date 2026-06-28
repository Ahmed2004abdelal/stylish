import 'package:bloc/bloc.dart';
import '../../data/models/products_model.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;

  HomeCubit({required this.homeRepoImpl}) : super(HomeState.initial());

    final List<String> sizes = [
    '6 UK',
    '7 UK',
    '8 UK',
    '9 UK',
    '10 UK',
  ];
  int selectedSize = 0;

  void fetchHomeCategory() async {
    emit(const HomeState.homeCategoryLoading());
    try {
      // Simulate fetching home category data
      final categoriesStream = await homeRepoImpl.fetchHomeCategory();
      emit(HomeState.homeCategorySuccess(categoriesStream));
    } catch (e) {
      emit(HomeState.homeCategoryError(e.toString()));
    }
  }

  void fetchHomeproducts() async {
    emit(const HomeState.homeProductLoading());
    try {
      // Simulate fetching home products data
      final productsStream = await homeRepoImpl.fetchHomeproducts();
      emit(HomeState.homeProductSuccess(productsStream));
    } catch (e) {
      emit(HomeState.homeProductError(e.toString()));
    }
  }

  void addToCart(ProductsModel prodcut) async {
    emit(const HomeState.addToCartLoading());
    try {
      await homeRepoImpl.addToCart(prodcut);
      emit(const HomeState.addToCartSuccess('Product added to cart successfully'));
    } catch (e) {
      emit(HomeState.addToCartError(e.toString()));
    }
  }
}
