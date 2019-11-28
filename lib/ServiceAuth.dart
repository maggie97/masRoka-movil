import 'package:http/http.dart';
import 'package:mas_roca/HttpRequest.dart';
import 'package:mas_roca/NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';

class ServiceAuth{
    static login(String user, String password, Function completion){
      NetworkLayer.request(AuthRouter.loginURL(user, password), (response){
        print(response.statusCode);
        completion(response.statusCode);
      });
      // var url = AuthRouter.loginURL(user, name, password);
      // var response  = NetworkLayer.requestPost(url.url, headers: {'Content-Type' : 'application/json'}, 
      // body: '{ "email": "$user", "name": "$name", "password": "$password" }');
      // print(response);
    }
}
class AuthRouter{
  static HTTPRequestConvertible loginURL(user, password ){
    return HTTPRequestConvertible(URL.heroku + '/login' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json'}, 
        body: '{ "email": "$user", "_token": "NZ5sClbtcyZ9b6ohouaUMgvQglgaH1aJOWkRT5YT", "password": "$password" }'
    );
  }
}