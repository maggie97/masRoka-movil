import 'package:http/http.dart' as http;
import 'HTTPRequestConvertible.dart';
import 'dart:async';

import 'HttpRequest.dart';

class NetworkLayer{
// ,{Map<String, String> headers, dynamic body} String url, HttpRequest typeRequest,
    static request(HTTPRequestConvertible urlRequest, Function success(http.Response response)) async {
      if(urlRequest.typeRequest == HttpRequest.get){
        //final http.Response response = await requestGet( url );
        requestGet(urlRequest.url).then((response){
          // print('get');
          success(response);
        });
      }
      else {
        requestPost(urlRequest.url, headers: urlRequest.headers, body: urlRequest.body).then((response) {
          // print(response);
          success(response);
        });
      }
    }
    static Future<http.Response> requestGet(String url) async {
      print('reques $url');
      return http.get(url);
    }
    static Future<http.Response> requestPost(String url, {Map<String, String> headers, dynamic body}){
      print('reques $url, $headers, $body');
      return http.post(url,
        headers: headers, 
        body: body); 
    }
}