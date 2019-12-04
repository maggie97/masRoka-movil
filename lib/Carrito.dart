import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Agregar%20Metodos%20de%20Pago.dart';
import 'package:mas_roca/Network/ServiceCarrito.dart';
import 'package:mas_roca/Network/ServiceProduct.dart';
import 'package:mas_roca/Product.dart';

import 'DetalleCarrito.dart';
import 'Drawer.dart';
import 'ConfirmaPago.dart';
import 'package:flutter/material.dart';

import 'Network/UserDefaults.dart';

class Carrito extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '+Roca',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(255, 173, 65, 1),
        secondaryHeaderColor: Color.fromRGBO(255, 173, 65, 1),
        backgroundColor: Color.fromRGBO(40, 52, 150, 1), //azul
      ),
      home: MyHomePage(title: 'Carrito xD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double total;
  List<String> listId = new List<String>();

  TextStyle style = TextStyle(
      fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  
  listProducts(){
    return StreamBuilder<QuerySnapshot>(
      stream: ServiceCarrito.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());//new Text('Loading...');
          default:
            return ListView(
              
              shrinkWrap: true,
              children: snapshot.data.documents
                  .map((DocumentSnapshot document) {
                    var detalle = DetalleCarrito.fromSnapshot(document);
                return  getCard(detalle);
                // CarritoCard(producto: DetalleCarrito(),); 
              }).toList()
            );
        }
      },
    );
  }

  Future<Product> getProductCaarrito(DetalleCarrito detalle) async {
    var doc = await ServiceProduct.getProduct(detalle.idProducto);
    var p = Product.fromSnapshot(doc);
    return p;
  }

  Widget getCard(DetalleCarrito detalle){
    listId.add(detalle.idProducto);
    return FutureBuilder<Product>(
      future: getProductCaarrito(detalle),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ?  CarritoCard(producto: snapshot.data, detalleCarrito: detalle,) 
            : Center(child: CircularProgressIndicator());
      },
    );
  }
  FutureBuilder<DocumentSnapshot> priceCarrito(){
    return FutureBuilder<DocumentSnapshot>(
      future: ServiceCarrito.getCarito(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        if(snapshot.data!= null){
          this.total =  double.parse(snapshot.data.data['total'].toString());
          print(total.toStringAsFixed(2));
          String _total = this.total.toStringAsFixed(2);
          return Text( "\$ $_total",style: TextStyle(fontSize: 30, color: Colors.grey[700], fontWeight: FontWeight.bold));
              
        }
        print(snapshot.data);
        Text( 'Loading...');
            // : Center(child: CircularProgressIndicator());
      },
    );

    
  }
  totalStream(){
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('carrito').document('${UserDefaults.shared.email}').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());//new Text('Loading...');
          default:
            total = snapshot.data.data['total'];
            return Text('\$ ${snapshot.data.data['total']}',style: TextStyle(fontSize: 30, color: Colors.grey[700], fontWeight: FontWeight.bold));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '       +Roca',
          style: TextStyle(fontSize: 35, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromRGBO(40, 52, 150, 1), //azul
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Center(
                    child:ListTile(

                      leading: Icon(Icons.shopping_cart,color:Color.fromRGBO(255, 173, 65, 1),size: 40,),
                      title: Text('Carrito de rocas',
                      style: TextStyle(fontSize: 35.0, color: Color.fromRGBO(255, 173, 65, 1), fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                      onTap: () {
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: listProducts(),
                  ),
                  
                   Padding(
                          padding:  const EdgeInsets.fromLTRB(0,0,0,15),
                          child: Container(
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                        child:Stack(
                                            children: <Widget>[
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(90,10,0,0),
                                                  alignment: Alignment.centerLeft,
                                                  child:Text("Total:",style: TextStyle(fontSize: 25, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              // priceCarrito(),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,8,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child: totalStream() ,
                                                  // child:Text("\$ ${total == 0? 0: total}",style: TextStyle(fontSize: 30, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                            ]
                                        )
                                    ),
                                  ]
                              )
                          )
                      ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                    child: Material(  //Wrap with Material
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                      elevation: 18.0,
                      color: Color.fromRGBO(255, 173, 65, 1),
                      clipBehavior: Clip.antiAlias, // Add This
                      child: MaterialButton(
                        minWidth: 250.0,
                        height: 50,
                        color:  Color.fromRGBO(255, 173, 65, 1),
                        child: new Text('Pagar',
                            style: new TextStyle(fontSize: 35.0, color: Colors.white)),
                        onPressed: () {
                          // ServiceCarrito.getDataList();
                          print(total);
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ConfirmaP(total: total ,list: listId,)),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
            padding: EdgeInsets.all(10),
        )


                ]
            )
        ),
      ),
      drawer: Cajon(),
    );
  }
  
  
}

class CarritoCard extends StatelessWidget{

  final DetalleCarrito detalleCarrito;
  final Product producto;
  const CarritoCard({Key key, this.producto, this.detalleCarrito}) : super(key: key);

  showImagen(){
    return Container(
      padding:  const EdgeInsets.fromLTRB(10,0,0,0),
      child:Image.asset(producto.routeImg, width: 100, height: 100,alignment:Alignment.centerLeft,),
    );
  }
  showNombre(){
    return Container(
        padding:  const EdgeInsets.fromLTRB(100,15,0,0),
        alignment: Alignment.topCenter,
        child:Text(producto.name, style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
    );
  }
  showCantidad(){
    return Container(
        padding:  const EdgeInsets.fromLTRB(100,45,0,0),
        alignment: Alignment.topCenter,

        child:Text("Cantidad: ${detalleCarrito.cantidad} ",style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold))
    );
  }
  showPrecio(){
    return Container(
        padding:  const EdgeInsets.fromLTRB(100,65,0,0),
        alignment: Alignment.topCenter,

        child:Text("Precio: \$ ${detalleCarrito.subtotal}",style: TextStyle(fontSize: 17.5, color: Colors.grey[700]))
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(
            Radius.circular(10.0) //         <--- border radius here
        )),
        child: Padding(
            padding:  const EdgeInsets.fromLTRB(0,0,0,0),
            child: Container(
                child: Column(
                    children: <Widget>[
                      Container(
                          child:Stack(
                              children: <Widget>[
                                showImagen(),
                                showNombre(),
                                showCantidad(),
                                showPrecio()
                              ]
                          )
                      ),
                      Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 0, 0,0),
                        child: Container(
                            child: Stack(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topRight,
                                    padding:  const EdgeInsets.fromLTRB(0,0,0,10),
                                    width: 90,
                                    child:Material(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Color.fromRGBO(40, 52, 150, 1),
                                      child: MaterialButton(
                                        onPressed: () {
                                        },
                                        child: Text("Detalles",
                                          textAlign: TextAlign.center, style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    padding:  const EdgeInsets.fromLTRB(10,0,0,10),
                                    width: 210,
                                    child:Material(
                                      borderRadius: BorderRadius.circular(30.0),

                                      color: Colors.red,
                                      child: MaterialButton(
                                        onPressed: () => ServiceCarrito.eliminaProducto(this.producto.productId),
                                        child: Text("Eliminar",
                                          textAlign: TextAlign.center, style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                

                                ]
                            )
                        ),
                      )
                    ]
                )
            )
        ),

      ),
    );
  }

}