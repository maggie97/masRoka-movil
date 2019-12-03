import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../Tarjeta.dart';
import 'HttpRequest.dart';
import 'NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';
import 'UserDefaults.dart';

class ServiceCard{
    static Future<List<Tarjeta>> getCards() async {
      var response = await NetworkLayer.requestGet(TarjetaRouter.getCards().url);
      print('status ${response.statusCode}');
      print('bidy');
      print(response.body);
      var list = compute(parseCards, response.body);
      print(list);
      return list;
    }
    static List<Tarjeta> parseCards(dynamic responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

      return parsed.map<Tarjeta>((json) => Tarjeta.fromJson(json)).toList();
    }


    static Future<List<Tarjeta>> getTarjetas() async {
      List<Tarjeta> list = new List<Tarjeta>();
      await Firestore.instance.collection('users').document(UserDefaults.shared.email)
      .collection('tarjetas').snapshots().forEach((snapshot){
        snapshot.documents.forEach((doc){
          // print(Tarjeta.fromSnapshot(doc));
          list.add(Tarjeta.fromSnapshot(doc));
        });
      });
      list.forEach((tarjeta){ print(tarjeta);});
      
      return list;
    }
}
class TarjetaRouter{
  static HTTPRequestConvertible getCards(){
    return HTTPRequestConvertible(URL.heroku + '/Tarjeta' , HttpRequest.get, 
    headers: {'User-Agent': 'MasRocka-movil'} );
  }
}