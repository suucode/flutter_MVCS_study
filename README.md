
## FutureProvider로 데이터 다운로드 받고, ViewModel 생성자에서 초기화 하는 법
```dart
final _initProvider = FutureProvider((ref) async {
  List<Product> productList = await ref.read(productHttpRepository).findAll();
  ref.read(productListViewModel.notifier).refresh(productList);
  return productList;
});

final productListViewModel =
StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel([], ref);
});

ProductListViewModel(super.state, this._ref) {
  _ref.read(_initProvider);
}
```

## initViewModel 로 repository 초기화 하는 법
- httpRepository에 연결되는게 맘에 안듬
```dart
final productListViewModel =
    StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel([], ref)..initViewModel();
});

  Future<void> initViewModel() async {
    state = await _ref.read(productHttpRepository).findAll();
  }
```