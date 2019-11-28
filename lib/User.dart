import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class User{
  final String email;
  final String name;
  final int id;
  final String password;

  User( {this.email, this.name, this.id, this.password,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      id: json['id']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
 
    return map;
  }
}