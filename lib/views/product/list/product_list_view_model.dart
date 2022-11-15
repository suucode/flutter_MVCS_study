import 'package:data_app/controller/product_controller.dart';
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListViewModel =
    StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel(ref.read(productHttpRepository).findAll());
});

class ProductListViewModel extends StateNotifier<List<Product>> {
  ProductListViewModel(super.state);

  void onLoad(List<Product> products) {
    state = products;
  }
}
