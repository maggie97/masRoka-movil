import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final int productId;
  final String name;
  final String routeImg;
  final int existences;

  final DocumentReference reference;

  Product( {this.productId, this.name, this.routeImg, this.existences, this.reference});


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      // productId: json['id'] as int,
      name: json['nombre'] as String,
      routeImg: json['path'] as String,
      existences: json['existencias'] as int
    );
  }

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['nombre'] != null),
        assert(map['path'] != null),assert(map['existencias'] != null),
        name = map['nombre'], productId = map['id'], routeImg = map['path'],
        existences = map['existencias'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // @override
  // String toString() => "Record<$name:$votes>";
}