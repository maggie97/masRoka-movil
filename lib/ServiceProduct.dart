import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mas_roca/HttpRequest.dart';
import 'package:mas_roca/NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';
import 'Product.dart';

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
    return HTTPRequestConvertible(URL.local + '/api/Producto' , HttpRequest.get );
  }
}