import 'package:data_app/domain/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListViewModel =
    StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel();
});

class ProductListViewModel extends StateNotifier<List<Product>> {
  ProductListViewModel() : super([]);

  void onLoad(List<Product> products) {
    state = products;
  }
}
