import 'package:http/http.dart';
import 'HttpRequest.dart';
import 'NetworkLayer.dart';

import 'HTTPRequestConvertible.dart';

class ServiceAuth{
    static login(String user, String password, Function completion){
      NetworkLayer.request(AuthRouter.loginURL(user, password), (response){
        print(response.statusCode);
        print('login:'+response.body);
        completion(response.statusCode);
      });
    }

    static logout(Function completion){
      NetworkLayer.request(AuthRouter.logOut(), (response){
        // print(response.statusCode);
        completion(response.statusCode);
      });
    }

    static registrar(String user, String password, String name, Function completion(int)){
      NetworkLayer.request(AuthRouter.registro(user, password, name), (response){
        print(response.statusCode);
        completion(response.statusCode);
      });
    }
    static Future<String> me() async {
      try{
        var body = await NetworkLayer.requestGet(AuthRouter.me().url);
        print('${body.statusCode}:: ${body.body}');
        return body.body;
      } catch (e){
        return e;
      }
    }
}
class AuthRouter{
  static final token = 'E4dye13K0P4HfZ8YGeFfHArNH2I7rxhOx1Pofe0r';
  static HTTPRequestConvertible loginURL(user, password ){
    return HTTPRequestConvertible(URL.heroku + '/authenticate' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json', 
        // 'User-Agent': 'MasRocka-movil'
                  // 'Cookie':'laravel_session=eyJpdiI6IjdQZTJrZDZVQjk4TG1la2ZIU2RpM2c9PSIsInZhbHVlIjoiQXYrU2NjNzdiQ0pwZThjUnlaeEk4eDFqUVwvbVpndTBHYnFNSENidzI0bkZWeTBzVzh3WWlaN3RWQ2lnQUhwWUkiLCJtYWMiOiI0ZTE4NDExMDg3MDQzMDE2NTU5NjE3YzkzNjQwMDFjOTBiOTRlZjFmYmU3ZWVjOTdmMDAxZGFiMmNkYWRiNWMzIn0%3D'
        }, 
        body: '{ "email": "$user", "_token": "$token", "password": "$password" }'
    );
  }
  static HTTPRequestConvertible logOut(){
    return HTTPRequestConvertible(URL.heroku + '/salir' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json', 'User-Agent': 'MasRocka-movil'}, 
        body: '{ "_token": "$token" }'
    );
  }

  static HTTPRequestConvertible registro(String user, String password, String name ){
    return HTTPRequestConvertible(URL.heroku + '/User' , HttpRequest.post, 
        headers: {'Content-Type' : 'application/json', 
              'User-Agent': 'MasRocka-movil',
              'Cookie':'laravel_session=eyJpdiI6IjdQZTJrZDZVQjk4TG1la2ZIU2RpM2c9PSIsInZhbHVlIjoiQXYrU2NjNzdiQ0pwZThjUnlaeEk4eDFqUVwvbVpndTBHYnFNSENidzI0bkZWeTBzVzh3WWlaN3RWQ2lnQUhwWUkiLCJtYWMiOiI0ZTE4NDExMDg3MDQzMDE2NTU5NjE3YzkzNjQwMDFjOTBiOTRlZjFmYmU3ZWVjOTdmMDAxZGFiMmNkYWRiNWMzIn0%3D'
        }, 
        body:'{ "email": "$user", "password": "$password" , "name": "$name"}'
    );
  }
  static HTTPRequestConvertible me( ){
    return HTTPRequestConvertible(URL.heroku + '/yo' , HttpRequest.get,
     headers: {'Content-Type' : 'application/json', 
                'Authorization': 'Barer $token'});
  }

  static HTTPRequestConvertible homr( ){
    return HTTPRequestConvertible(URL.heroku + '/home' , HttpRequest.get,
     headers: {'Content-Type' : 'application/json', 'User-Agent': 'MasRocka-movil'} );
  }
}