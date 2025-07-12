import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stylish_app/ProductModel.dart';
import 'package:stylish_app/screens/home_screen/model/product_category.dart';

class ProductService {
  static Future<ProductOfModel> getProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProductOfModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load Products');
    }
  }

  static Future<List<ProductCategory>> getCategory() async {
    final url = Uri.parse('https://dummyjson.com/products/categories');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((item) => ProductCategory.fromJson(item));
    } else {
      throw Exception("Failed to load category");
    }
  }
}
