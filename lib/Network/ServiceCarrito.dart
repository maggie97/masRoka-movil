import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Network/UserDefaults.dart';

import '../Product.dart';

class ServiceCarrito{
  static void agregaProducto(String idProducto, Product producto, int cantidad, double precio){
    print('producto $producto, $idProducto, $cantidad, $precio');
    // Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').collection(collectionPath)
    Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').collection('productos').document('$idProducto')
      .setData({ 'idProducto' : idProducto,'cantidad': cantidad, 'precio': precio*cantidad }, merge: true).whenComplete((){
            getCarito().then((response){
          double total = double.parse(response.data['total'].toString());
          updateData(total + precio);
        });
      });
    
  }

  static Stream<QuerySnapshot> getData() {
    return Firestore.instance.collection('carrito')
            .document('${UserDefaults.shared.email}').collection('productos').snapshots();
  }
  static  carritoToVentas(String tarjetaId, List<String> productos) async {
    double total = 0;
    
    await getCarito().then((doc) async {
      total = doc.data['total'];
      var date = DateTime.now();
      Firestore.instance.collection('ventas').document('${UserDefaults.shared.email}').collection('ventas').document(date.toString())
            .setData({'total': total, 'tarjetaId': tarjetaId}, merge: true);

    });
    for (var producto in productos) {
      print(producto);
      Firestore.instance.collection('carrito')
          .document('${UserDefaults.shared.email}').collection('productos').document('$producto').delete();
    }
   Firestore.instance.collection('carrito')
          .document('${UserDefaults.shared.email}').updateData({'total': 0});
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

  static eliminaCarrito({Function onError}) async {
    print(UserDefaults.shared.email);
    var docs = await Firestore.instance
        .collection('carrito')
        .document(UserDefaults.shared.email).collection('productos').limit(100).getDocuments();
    for(int i =0 ; i < docs.documents.length; i++ ){
      var doc = docs.documents[i];
      print(doc.documentID);
      Firestore.instance
        .collection('carrito')
        .document(UserDefaults.shared.email).collection('productos').document(doc.documentID).delete();
    }
    // docs.documents.removeRange(0, docs.documents.length -1);
        // .snapshots().forEach((action){
        //   action.documents.forEach((f){
        //     Firestore.instance
        //       .collection('carrito')
        //       .document(UserDefaults.shared.email).collection('productos').document(f.documentID).delete();
        //     return;
        //   });
        // });
  }

}