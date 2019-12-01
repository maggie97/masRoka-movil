import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'HttpRequest.dart';
import 'NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';
import '../Product.dart';

class ServiceProduct{
    static Future<List<Product>> getProducts() async {
      var response = await NetworkLayer.requestGet(ProductRouter.getProducts().url);
      
      var list = compute(parseProducts, response.body);
      return list;
    }
    static List<Product> parseProducts(dynamic responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    }
}
class ProductRouter{
  static HTTPRequestConvertible getProducts(){
    return HTTPRequestConvertible(URL.local + '/Producto' , HttpRequest.get );
  }
}