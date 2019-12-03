
import 'HttpRequest.dart';

class HTTPRequestConvertible {
  final String url;
  final HttpRequest typeRequest;
  final Map <String, String> headers;
  final dynamic body;

  HTTPRequestConvertible(this.url, this.typeRequest, {this.headers, this.body});
}

class URL {
  static String heroku = 'http://masrocka.herokuapp.com';
  static String local = 'http://localhost:8000';
}