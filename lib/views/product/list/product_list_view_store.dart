import 'package:data_app/controller/product_controller.dart';
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:data_app/views/components/my_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListViewAlert = StateProvider<bool>((ref) => false);

final productListViewStore =
    StateNotifierProvider<ProductListViewStore, List<Product>>((ref) {
  return ProductListViewStore(ref.read(productHttpRepository).findAll(), ref);
});

class ProductListViewStore extends StateNotifier<List<Product>> {
  Ref _ref;
  ProductListViewStore(super.state, this._ref);

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
        product.price = 60000;
        return product;
      } else {
        return product;
      }
    }).toList();
  }
}
