import '../data_source/product_api.dart';
import '../model/product.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _api;

  ProductRepositoryImpl(this._api);

  @override
  Future<List<Product>> getProductList() async {
    List<Product> product = await _api.getItems();
    return product;
  }
}
