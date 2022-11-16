import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListViewAlert = StateProvider<bool>((ref) => false);

final productListViewStore =
    StateNotifierProvider<ProductListViewStore, List<Product>>((ref) {
  return ProductListViewStore(ref.read(productHttpRepository).findAll());
});

class ProductListViewStore extends StateNotifier<List<Product>> {
  ProductListViewStore(super.state);

  void onRefresh(List<Product> productsDto) {
    state = productsDto;
  }

  void addProduct(Product productRespDto) {
    state = [...state, productRespDto];
  }

  void removeProduct(int id) {
    state = state.where((product) => product.id != id).toList();
  }

  void updateProduct(Product productRespDto) {
    state = state.map((product) {
      if (product.id == productRespDto.id) {
        return productRespDto;
      } else {
        return product;
      }
    }).toList();
  }
}
