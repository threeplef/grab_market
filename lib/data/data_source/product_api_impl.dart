import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';
import 'product_api.dart';

class ProductApiImpl implements ProductApi {
  final http.Client _client;

  ProductApiImpl({http.Client? client}) : _client = (client ?? http.Client());

  @override
  Future<List<Product>> getItems() async {
    Uri url = Uri.parse('http://10.0.2.2:3000/items');

    http.Response response = await _client.get(url);

    String jsonString = response.body;

    List<dynamic> json = jsonDecode(jsonString);
    List<Product> products = json.map((e) => Product.fromJson(e)).toList();
    return products;
  }
}
