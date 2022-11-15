// VIEW -> Controller
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:data_app/views/product/list/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/product/product.dart';

final productController = Provider<ProductController>((ref) {
  return ProductController(ref);
});

class ProductController {
  ProductHttpRepository repo = ProductHttpRepository();
  final Ref _ref;
  ProductController(this._ref);

  void findAll() {
    List<Product> productList = repo.findAll();
    _ref.read(productListViewModel.notifier).onLoad(productList);
  }
}
