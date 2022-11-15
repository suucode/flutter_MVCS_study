import 'package:data_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pc = ref.read(productController);
    pc.findAll();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(title: Text("product_list_page")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          onTap: () {},
          leading: Icon(Icons.account_balance_wallet),
          title: Text(
            "바나나",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("1000"),
        ),
      ),
    );
  }
}
