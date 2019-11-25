import 'package:mas_roca/home.dart';

import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'Carrito.dart';

class Compra extends StatelessWidget {
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
      home: MyHomePage(title: 'Bienvenidos :3'),
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
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      Image.asset("images/fin.jpg"),
                      Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Center(
                        child:Container(
                          //leading: Icon(Icons.shopping_cart,color:Color.fromRGBO(255, 173, 65, 1),size: 40,),
                          child: Text('Pago exitoso!',
                            style: TextStyle(fontSize: 35.0, color: Color.fromRGBO(255, 173, 65, 1), fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                        child: Material(  //Wrap with Material
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                          elevation: 18.0,
                          color: Color.fromRGBO(255, 173, 65, 1),
                          clipBehavior: Clip.antiAlias, // Add This
                          child: MaterialButton(
                            minWidth: 250.0,
                            height: 50,
                            color:  Color.fromRGBO(255, 173, 65, 1),
                            child: new Text('Continuar',
                                style: new TextStyle(fontSize: 35.0, color: Colors.white)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu()),
                              );
                            },
                          ),
                        ),
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