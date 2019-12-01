import 'package:mas_roca/home.dart';

import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'Carrito.dart';
import 'Detalles.dart';
class AgregaTarjeta extends StatelessWidget {
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
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    super.dispose();
  }

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
      drawer:  Cajon(),
      body: SingleChildScrollView(
        child: Container(
          //color: Color.fromRGBO(155, 250, 208, 0.3),
          //width: MediaQuery.of(context).size.width - 80,
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                //color: Color.fromRGBO(155, 250, 208, 0.3),
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    Center(
                      child:Container(
                        //leading: Icon(Icons.shopping_cart,color:Color.fromRGBO(255, 173, 65, 1),size: 40,),
                        child: Text('Agregar Tarjeta',
                          style: TextStyle(fontSize: 35.0, color: Color.fromRGBO(255, 173, 65, 1), fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      margin: EdgeInsets.all(5.0),
                      child: Column(

                        children: <Widget>[
                          TextField(
                            textAlign: TextAlign.center,
                            maxLength: 16,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                              labelText: "Número de Tarjeta",
                              prefixIcon: Icon(
                                Icons.card_membership, color: Color.fromRGBO(57, 52, 36, 1.0),
                              ),
                            ),
                            controller: myController,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      alignment: Alignment.center,
                      //margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Column(

                              children: <Widget>[

                                TextField(
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    hintText: "Mes",
                                    labelText: "Mes",
                                    prefixIcon: Icon(
                                      Icons.calendar_view_day, color: Color.fromRGBO(57, 52, 36, 1.0),
                                    ),

                                  ),
                                  controller: myController2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Column(

                              children: <Widget>[

                                TextField(
                                  maxLength: 4,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    hintText: "Año",
                                    labelText: "Año",
                                    prefixIcon: Icon(
                                      Icons.calendar_today, color: Color.fromRGBO(57, 52, 36, 1.0),
                                    ),),
                                  controller: myController3,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Column(

                              children: <Widget>[
                                TextField(
                                  textAlign: TextAlign.center,
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    hintText: "CVV",
                                    labelText: "CVV",
                                    prefixIcon: Icon(
                                      Icons.security, color: Color.fromRGBO(57, 52, 36, 1.0),
                                    ),),
                                    controller: myController4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding:  const EdgeInsets.fromLTRB(0,0,0,0),
                        child: Container(
                            child: Column(
                                children: <Widget>[
                                  Container(
                                      child:Stack(
                                          children: <Widget>[
                                            Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width - 299,
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 15.0, 15, 0),
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    color: Colors.grey[700],
                                                    child: MaterialButton(
                                                      minWidth: MediaQuery.of(context).size.width,
                                                      padding: EdgeInsets.fromLTRB(
                                                          20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo

                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                          MaterialPageRoute(builder: (context) => Carrito()),
                                                        );
                                                      },
                                                      child: Text("Regresar",
                                                        textAlign: TextAlign.center,style: TextStyle(color: Colors.white),
                                                      ),

                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width - 210,
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(100, 15, 0, 15),
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    color: Color.fromRGBO(40, 52, 150, 1),
                                                    child: MaterialButton(
                                                      minWidth: MediaQuery.of(context).size.width,
                                                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
                                                      onPressed: () {
                                                        revisa(myController.text, myController2.text, myController3.text, myController4.text);
                                                      },
                                                      child: Text("Agregar",
                                                        textAlign: TextAlign.center,style: TextStyle(color: Colors.white),
                                                      ),

                                                    ),
                                                  ),
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                ]
                            )
                        )
                    ),
                    ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> revisa(String tar, String mes,String fec,String cvv) {
    if (tar != "" && mes != ""&& fec != ""&& cvv != "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Tarjeta Agregada con Exito'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Regresa'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    );
                  },
                ),
              ],
            );
          }
      );
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Llena todos los campos'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Regret'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
