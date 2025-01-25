import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../entities/product_entity.dart';
import '../../repos/product_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)));
  }


  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)));
  }
}
