import 'package:cloud_firestore/cloud_firestore.dart';

import 'Product.dart';

class DetalleCarrito{
  final String idProducto;
  final int cantidad;
  final double subtotal;

  DocumentReference reference;

  DetalleCarrito({this.idProducto, this.cantidad, this.subtotal});

  DetalleCarrito.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(reference != null), assert(map['idProducto'] != null),
        assert(map['cantidad'] != null),assert(map['precio'] != null),
        idProducto = reference.documentID, 
        cantidad = map['cantidad'], subtotal = map['precio'];

  DetalleCarrito.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  
}