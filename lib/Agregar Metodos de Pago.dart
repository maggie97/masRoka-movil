import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Network/ServiceAuth.dart';
import 'package:mas_roca/Network/UserDefaults.dart';
import 'package:mas_roca/Tarjeta.dart';

import 'Drawer.dart';
import 'ConfirmaPago.dart';
import 'package:flutter/material.dart';
import 'Agregar Tarjeta.dart';
import 'Network/ServiceCard.dart';

class Metodos extends StatelessWidget {
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

  TextStyle style = TextStyle(
      fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);

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
      body: 
      // SingleChildScrollView(
        // child: 
        Center(
            child: Column(
                children: <Widget>[

                  Center(

                    child:ListTile(
                      title: Text('Métodos de pagos',
                        style: TextStyle(fontSize: 35.0, color: Color.fromRGBO(255, 173, 65, 1), fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,),
                      onTap: () {
                      },
                    ),
                  ),
                  
                  getCardListFirebase(),
                  // Button_CornerRadius(text: 'Button',color: Colors.red),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5, 0.0, 0.0),
                    child: Material(  //Wrap with Material
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                      elevation: 18.0,
                      color: Color.fromRGBO(255, 173, 65, 1),
                      clipBehavior: Clip.antiAlias, // Add This
                      child: MaterialButton(
                        minWidth: 250.0,
                        height: 50,
                        color:  Color.fromRGBO(255, 173, 65, 1),
                        child: new Text('Agregar otra tarjeta',
                            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AgregaTarjeta         ()),
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
        // ),
      ),
      drawer: Cajon(),
    );
  }
  getCardList(){
    return FutureBuilder<List<Tarjeta>>(
      future: ServiceCard.getCards(),
      builder: (context, snapshot) {
        
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? TarjetaList(card: snapshot.data)
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
              return Container(
                height: MediaQuery.of(context).size.height - 220,
                child: ListView(
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 1,
                  // ),
                  shrinkWrap: true,
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return 
                      CustomCard(
                        tarjeta: Tarjeta.fromSnapshot(document),
                      );
                  }).toList()
                )
              );
            }
        }
      },
    );
  }

}

class TarjetaList extends StatelessWidget {
  final List<Tarjeta> card;
  final String route;

  TarjetaList({Key key, this.card, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: card.length,
      itemBuilder: (context, index) {
        return  
          CustomCard(
            tarjeta: card[index],
          );
      },
    );
  }
}
class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.tarjeta, this.width}): super(key: key);

  final Tarjeta tarjeta;
  final double width;

  BuildContext get context => null;

  Widget build(BuildContext context) {
    int length = tarjeta.numero.length;
    String lastNumbers = tarjeta.numero[length-3]+tarjeta.numero[length-2]+tarjeta.numero[length-1];
    return 
    // SizedBox(
    //   width: width,
    //   child: 
      Padding(
        padding: EdgeInsets.all(10.0),
        child: 
        Container(
          // height: 100,
          width: 1000,
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(
              Radius.circular(10.0) //         <--- border radius here
          )),
          // child: Padding(
          //     padding:   EdgeInsets.fromLTRB(0,0,0,0),
              child: Container(
                 
                  child:  Column( 
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Container(
                            child:Stack(
                                children: <Widget>[
                                  Container(
                                      padding:  const EdgeInsets.fromLTRB(0,15,0,0),
                                      alignment: Alignment.topCenter,
                                      child:Text("Visa **********$lastNumbers",style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                  ),
                                  Container(
                                      padding:  const EdgeInsets.fromLTRB(0,45,0,0),
                                      alignment: Alignment.topCenter,
                                      child:Text("Vence el ${tarjeta.vencimiento}",style: TextStyle(fontSize: 20, color: Colors.grey[700]))
                                  ),
                                ]
                            )
                        ),
                        buttons(context),
                        
                  ])
              // )
          ),
        ),
      // ),
    );
  }

  buttons(BuildContext context){
    return Padding(
      padding:  const EdgeInsets.fromLTRB(0, 20, 0,0),
      child:Container(
          child:Stack(
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AgregaTarjeta(title: "Editar Tarjeta", tarjeta: tarjeta,)),
                          );
                      },
                      child: Text("Editar",
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
                      onPressed: (){
                        eliminaTarjeta(tarjeta.id);
                      },
                      child: Text("Eliminar",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
                ]
          )
      ),
    );
  }
  eliminaTarjeta(String docId){
    Firestore.instance
        .collection('users')
        .document(UserDefaults.shared.email).collection('tarjetas').document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
class Button_CornerRadius extends StatelessWidget{
  final Color color;
  final String text;
  final Function onTap;
  final double width;

  const Button_CornerRadius({Key key, this.color, this.text, this.onTap, this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = width;
    if (width == null )
      _width = (MediaQuery.of(context).size.width/3);

    return Container(
      alignment: Alignment.topRight,
      padding:  const EdgeInsets.fromLTRB(10,0,0,10),
      width: _width,
      child:Material(
        borderRadius: BorderRadius.circular(30.0),

        color: color,
        child: MaterialButton(
          onPressed: onTap,
          child: Text("$text",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
  
}