import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Network/UserDefaults.dart';

class ServiceCarrito{
  static Future<void> agregaProducto(String idProducto, int cantidad, double precio){
    print(UserDefaults.shared.email);
    return Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').collection('productos').document('$idProducto')
      .setData({ 'idProducto' : idProducto, 'cantidad': cantidad, 'precio': precio*cantidad }, merge: true);
  }

  static getData() async {
    return Firestore.instance.collection('carrito')
            .document('${UserDefaults.shared.email}').collection('productos').snapshots();
  }

}