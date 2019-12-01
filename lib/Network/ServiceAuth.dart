import 'package:http/http.dart';
import 'HttpRequest.dart';
import 'NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';

class ServiceAuth{
    static login(String user, String password, Function completion){
      NetworkLayer.request(AuthRouter.loginURL(user, password), (response){
        print(response.statusCode);
        completion(response.statusCode);
      });
    }

    static logout(Function completion){
      NetworkLayer.request(AuthRouter.logOut(), (response){
        print(response.statusCode);
        completion(response.statusCode);
      });
    }

    static registrar(String user, String password, String name, Function completion(int)){
      NetworkLayer.request(AuthRouter.registro(user, password, name), (response){
        print(response.statusCode);
        completion(response.statusCode);
      });
    }
}
class AuthRouter{
  static final token = 'LrlBLT58r6swGZYWtHDOU92AWLRedXlwL7qiF7yF';
  static HTTPRequestConvertible loginURL(user, password ){
    return HTTPRequestConvertible(URL.heroku + '/login' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json'}, 
        body: '{ "email": "$user", "_token": "$token", "password": "$password" }'
    );
  }
  static HTTPRequestConvertible logOut(){
    return HTTPRequestConvertible(URL.heroku + '/logout' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json'}, 
        body: '{ "_token": "$token" }'
    );
  }

  static HTTPRequestConvertible registro(String user, String password, String name ){
    return HTTPRequestConvertible(URL.heroku + '/logout' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json'}, 
        body:'{ "email": "$user", "password": "$password" , "name": "$name"}'
    );
  }
}