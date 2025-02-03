import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);

    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increasCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartProductAdded());
  }
}
