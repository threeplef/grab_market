import '../model/product.dart';

abstract class ProductApi {
  Future<List<Product>> getItems();
}
