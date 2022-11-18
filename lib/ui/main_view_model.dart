import 'package:flutter/material.dart';

import '../data/data_source/product_api_impl.dart';
import '../data/model/product.dart';
import '../data/repository/product_repository_impl.dart';

class MainViewModel extends ChangeNotifier {
  final _productRepositoryImpl = ProductRepositoryImpl(ProductApiImpl());
  List<Product> productList = [];

  MainViewModel() {
    getList();
  }

  Future getList() async {
    productList = await _productRepositoryImpl.getProductList();
    notifyListeners();
  }
}
