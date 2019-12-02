import 'package:cloud_firestore/cloud_firestore.dart';

class Tarjeta{
  final String id;
  final String numero;
  final int validacion;
  final String vencimiento;

  final DocumentReference reference;

  const Tarjeta( {this.vencimiento, this.id, this.numero, this.validacion, this.reference,});


  factory Tarjeta.fromJson(Map<String, dynamic> json) {
    return Tarjeta(
      id: json['id'] as String,
      numero: json['numeroTarjeta'] as String,
      validacion: json['validacion'] as int,
      vencimiento: json['vencimiento'] as String
    );
  }

  Tarjeta.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(reference != null), assert(map['numeroTarjeta'] != null),
        assert(map['cvv'] != null),assert(map['vencimiento'] != null),
        id = reference.documentID,numero = map['numeroTarjeta'], validacion = map['cvv'], 
        vencimiento = map['vencimiento'];

  Tarjeta.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  /* {
        "id": 1,
        "user_id": "1",
        "numeroTarjeta": "123456789012",
        "vencimiento": "01/2020",
        "validacion": "123",
        "created_at": "2019-12-01 02:19:22",
        "updated_at": "2019-12-01 02:19:22"
    } */
}