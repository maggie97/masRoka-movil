import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../Tarjeta.dart';
import 'HttpRequest.dart';
import 'NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';

class ServiceCard{
    static Future<List<Tarjeta>> getCards() async {
      var response = await NetworkLayer.requestGet(TarjetaRouter.getCards().url);
      print(response.body);
      var list = compute(parseCards, response.body);
      print(list);
      return list;
    }
    static List<Tarjeta> parseCards(dynamic responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

      return parsed.map<Tarjeta>((json) => Tarjeta.fromJson(json)).toList();
    }
}
class TarjetaRouter{
  static HTTPRequestConvertible getCards(){
    return HTTPRequestConvertible(URL.heroku + '/Tarjeta' , HttpRequest.get );
  }
}