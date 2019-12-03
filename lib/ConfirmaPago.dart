import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Agrega%20Direcci%C3%B3n.dart';
import 'package:mas_roca/Finalizar%20Compra.dart';
import 'package:mas_roca/Network/ServiceCarrito.dart';
import 'package:mas_roca/Tarjeta.dart';
import 'Drawer.dart';
import 'Agregar Tarjeta.dart';
import 'package:flutter/material.dart';
import 'Carrito.dart';
import 'Network/ServiceCard.dart';
import 'Network/UserDefaults.dart';
class ConfirmaP extends StatelessWidget {
  // This widget is the root of your application.
  final double total;

  const ConfirmaP({Key key, this.total = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '+Roca',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(255, 173, 65, 1),
        secondaryHeaderColor: Color.fromRGBO(255, 173, 65, 1),
        backgroundColor: Color.fromRGBO(40, 52, 150, 1), //azul
      ),
      home: MyHomePage(title: 'Bienvenidos :3', total: total,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.total}) : super(key: key);

  final String title;
  final double total;


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextStyle style = TextStyle(
      fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  String dropdownValue = '************0990';
 
  muestraDropdawn(List<Tarjeta> list){
    print('length' + getOptions(list).length.toString());
    var listDrop =  list.map<DropdownMenuItem<String>>((value) {
            print(value.id);
            var leng = value.numero.length - 1;
            var lastNumbers = value.numero[leng- 2] + value.numero[leng -1 ] +value.numero[leng];
              return DropdownMenuItem<String>(
                value: value.id ,
                child: Text('*************${lastNumbers}'),
              );
            }
          ).toList();
    listDrop.add(DropdownMenuItem<String>(
                value: 'Agregar...',
                child: Text('Agregar...'),
              ));
    getOptions(list).forEach((f){print(f.value);});
    dropdownValue = list[0].id;
    return Container(
      padding:  const EdgeInsets.fromLTRB(190,15,0,0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 20,
        elevation: 16,
        style: TextStyle(
            color: Colors.black
        ),
        underline: Container(
          height: 2,
          color: Colors.grey,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          if(newValue == 'Agregar ....'){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgregaTarjeta()));
          }
        },
        items: listDrop
      )
    );
  }
  List<DropdownMenuItem<String>> getOptions(List<Tarjeta> list){
    print(list.length);
    return list.map<DropdownMenuItem<String>>((value) {
      print(value);
        return DropdownMenuItem<String>(
          value: value.numero,
          child: Text(value.numero),
        );
      }
    ).toList();
  }
  getCardList(){
    print('future');
    return FutureBuilder<List<Tarjeta>>(
      future: ServiceCard.getTarjetas(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? muestraDropdawn(snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
  getCardListFirebase(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').document(UserDefaults.shared.email).collection('tarjetas').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            if(snapshot.data.documents.length == 0){
              return Text('No hay tarjetas');
            } else {
              var list = snapshot.data.documents.map((DocumentSnapshot document) {
                    return Tarjeta.fromSnapshot(document);
                  }).toList();
              return Container(
                height: MediaQuery.of(context).size.height - 220,
                child: muestraDropdawn(list)
                );
            }
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
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  ),
                  Center(
                    child:Container(
                      //leading: Icon(Icons.shopping_cart,color:Color.fromRGBO(255, 173, 65, 1),size: 40,),
                      child: Text('Confirmar Pago',
                        style: TextStyle(fontSize: 35.0, color: Color.fromRGBO(255, 173, 65, 1), fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child:ListTile(
                      title: Text("Dirección de envio: ",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(0.0),
                      child:Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(
                          Radius.circular(20.0)//         <--- border radius here
                          )
                      ),
                          child: Padding(
                              padding:  const EdgeInsets.fromLTRB(5,5,5,5),
                              child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title:Text("Ignacio Manuel Altamirano #450 Fraccionamiento Las Norias San Luis Potosi, SLP CP: 78143",
                                        style: TextStyle(fontSize: 15.0),textAlign: TextAlign.left,),
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgregaDirec()));
                                      },
                                    )
                                  ]
                              )
                          )
                      )
                  ),
                  Padding(
                      padding:  const EdgeInsets.fromLTRB(0,10,0,5),
                      child: Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                    child:Stack(
                                        children: <Widget>[
                                          Container(
                                              padding:  const EdgeInsets.fromLTRB(40,10,0,0),
                                              alignment: Alignment.centerLeft,
                                              child:Text("Monto a pagar:",style: TextStyle(fontSize: 19, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                          ),
                                          Container(
                                              padding:  const EdgeInsets.fromLTRB(110,10,0,0),
                                              alignment: Alignment.topCenter,

                                              child:Text("\$ ${widget.total.toStringAsFixed(2)}",style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          )
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child:ListTile(
                      title: Text("Metodo de Pago: ",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                      padding:  const EdgeInsets.fromLTRB(0,10,0,15),
                      child: Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                    child:Stack(
                                        children: <Widget>[
                                          Container(
                                              padding:  const EdgeInsets.fromLTRB(40,0,0,0),
                                              alignment: Alignment.centerLeft,
                                              child:Image.asset("images/pago.png",width: 120,)
                                          ),
                                          getCardListFirebase()
                                        ]
                                    )
                                ),
                              ]
                          )
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/6, MediaQuery.of(context).size.height/4, 0.0, 0.0),
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
                            ServiceCarrito.carritoToVentas(dropdownValue);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Compra()),
                            );
                          },
                        ),
                      ),
                    ),
                    ],
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(35),
                  )

                ]
            )
        )
      ),
      drawer: Cajon(),
    );
  }

}