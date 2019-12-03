import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Network/UserDefaults.dart';

import '../Product.dart';

class ServiceCarrito{
  static void agregaProducto(String idProducto, Product producto, int cantidad, double precio){
    Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').collection('productos').document('$idProducto')
      .setData({ 'idProducto' : idProducto,'cantidad': cantidad, 'precio': precio*cantidad }, merge: true);
    getCarito().then((response){
      double total = double.parse(response.data['total'].toString());
      updateData(total + precio);
    });
  }

  static Stream<QuerySnapshot> getData() {
    return Firestore.instance.collection('carrito')
            .document('${UserDefaults.shared.email}').collection('productos').snapshots();
  }
  static  carritoToVentas(String tarjetaId) async {
    double total = 0;
    
    await getCarito().then((doc) async {
      total = doc.data['total'];
      
      Firestore.instance.collection('ventas').document('${UserDefaults.shared.email}')
            .setData({'total': total, 'tarjetaId': tarjetaId}, merge: true);
      var wait = await getData().forEach((snapshot){
        snapshot.documents.forEach((doc){
          Firestore.instance.collection('ventas').document('${UserDefaults.shared.email}').collection('ventas')
            .document().collection('productos').document('${doc.documentID}')
            .setData(doc.data, merge: true);
        });
      });

    });
   
  }

  static Future<DocumentSnapshot> getCarito() async {
     return await Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').get();
  }
  static updateData(double total){
    Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').updateData({'total': total});
  }

  static eliminaProducto(String docId, {Function onError}){
    Firestore.instance
        .collection('carrito')
        .document(UserDefaults.shared.email).collection('productos').document(docId)
        .delete()
        .catchError((e) {
      print(e);
      onError();
    });
  }

  static eliminaCarrito(String docId, {Function onError}){
    Firestore.instance
        .collection('carrito')
        .document(UserDefaults.shared.email)
        .delete()
        .catchError((e) {
      onError();
    });
  }

}