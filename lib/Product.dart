import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String productId;
  final String name;
  final String routeImg;
  final int existences;
  final String locacion;
  final String descripcion;
  final double precio;

  final DocumentReference reference;

  Product( {this.productId, this.name, this.routeImg, this.existences, this.reference, this.locacion, this.descripcion, this.precio,});


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id'] as String,
      name: json['nombre'] as String,
      routeImg: json['path'] as String,
      existences: json['existencias'] as int,
      locacion: json['localizacion'],
      descripcion: json['descripcion'],
      precio: json['precio'],
    );
  }

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['nombre'] != null), assert(map['path'] != null), assert(map['existencias'] != null),
        assert(map['localizacion'] != null), assert(map['descripcion'] != null), 
        assert(reference != null), assert(map['precio'] != null),
        name = map['nombre'], productId = reference.documentID, routeImg = map['path'],
        existences = map['existencias'], locacion = map['localizacion'], 
        descripcion = map['descripcion'], precio = map['precio'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // @override
  // String toString() => "Record<$name:$votes>";
}