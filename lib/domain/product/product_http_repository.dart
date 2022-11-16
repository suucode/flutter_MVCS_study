import 'dart:convert';

import 'package:data_app/domain/http_connector.dart';
import 'package:data_app/domain/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final productHttpRepository = Provider<ProductHttpRepository>((ref) {
  return ProductHttpRepository(ref);
});

class ProductHttpRepository {
  Ref _ref;
  ProductHttpRepository(this._ref);

  Future<Product> findById(int id) async {
    Response response =
        await _ref.read(httpConnector).get("/api/product/${id}");
    Product product = Product.fromJson(jsonDecode(response.body));
    return product;
  }

  Future<List<Product>> findAll() async {
    Response response = await _ref.read(httpConnector).get("/api/product");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)["data"];
      List<Product> productList = body.map((e) => Product.fromJson(e)).toList();
      return productList;
    } else {
      return [];
    }
  }

  // name, price
  Product insert(Product product) {
    // http 통신 코드 (product 전송)
    product.id = 4;

    return product;
  }

  Product updateById(int id, Product productDto) {
    // http 통신 코드
    final list = [].map((product) {
      if (product.id == id) {
        return productDto;
      } else {
        return product;
      }
    }).toList();
    productDto.id = id;
    return productDto;
  }

  int deleteById(int id) {
    // http 통신 코드
    final list = [].where((product) => product.id != id).toList();
    if (id == 4) {
      return -1;
    } else {
      return 1;
    }
  }
}
