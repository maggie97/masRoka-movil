import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/Network/UserDefaults.dart';
import 'package:mas_roca/Tarjeta.dart';
import 'package:mas_roca/home.dart';

import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'Carrito.dart';
import 'Detalles.dart';
// class AgregaTarjeta extends StatelessWidget {
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: '+Roca',
//       theme: new ThemeData(
//         primaryColor: Color.fromRGBO(255, 173, 65, 1),
//         secondaryHeaderColor: Color.fromRGBO(255, 173, 65, 1),
//         backgroundColor: Color.fromRGBO(40, 52, 150, 1), //azul
//       ),
//       home: MyHomePage(title: 'Bienvenidos :3'),
//     );
//   }
// }

class AgregaTarjeta extends StatefulWidget {
  AgregaTarjeta({Key key, this.title = 'Agregar Tarjeta', this.tarjeta}) : super(key: key);

  final String title;
  final Tarjeta tarjeta;

  @override
  _AgregaTarjeta createState() => new _AgregaTarjeta();
}

class _AgregaTarjeta extends State<AgregaTarjeta> {
  var myControllerCard = TextEditingController();
  var myControllerMes = TextEditingController();
  var myControllerYear = TextEditingController();
  var myControllerCVV = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(widget.tarjeta != null){
      myControllerCard.text = widget.tarjeta.numero;
      var vencimiento = widget.tarjeta.vencimiento.split('/');
      myControllerMes.text = vencimiento[0];
      myControllerYear.text = vencimiento[1];
      myControllerCVV.text = widget.tarjeta.validacion.toString();
    }
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myControllerCard.dispose();
    myControllerMes.dispose();
    myControllerYear.dispose();
    myControllerCVV.dispose();
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
                        child: Text('${widget.title}',
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
                            controller: myControllerCard,
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
                                  controller: myControllerMes,
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
                                  controller: myControllerYear,
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
                                    controller: myControllerCVV,
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
                                                alignment: Alignment.bottomLeft,
                                                width: 120,
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 15.0, 25, 0),
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    color: Colors.grey[700],
                                                    child: MaterialButton(
                                                      minWidth: MediaQuery.of(context).size.width,
                                                      padding: EdgeInsets.fromLTRB(
                                                          20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo

                                                      onPressed: () {
                                                        Navigator.of(context).pop();
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
                                                width: MediaQuery.of(context).size.width/2,
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(100, 15, 0, 15),
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    color: Color.fromRGBO(40, 52, 150, 1),
                                                    child: MaterialButton(
                                                      minWidth: MediaQuery.of(context).size.width,
                                                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
                                                      onPressed: () {
                                                        revisa(myControllerCard.text, myControllerMes.text, myControllerYear.text, myControllerCVV.text);
                                                      },
                                                      child: Text("Aceptar",
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
      try{
        if(widget.title != 'Agregar Tarjeta'){
          updateRecord(int.parse(cvv), tar, mes + '/'+ fec);
        }
        else {
          createRecord(int.parse(cvv), tar, mes + '/'+ fec);
        }
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tarjeta Agregada con Exito'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Regresa'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }
        );
      }
      catch (exc){
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(exc.toString()),
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
  void createRecord(int cvv, String numero, String fechaVenc) {
    Firestore.instance.collection('users').document(UserDefaults.shared.email).collection('tarjetas').document()
      .setData({ 'cvv': cvv, 'numeroTarjeta': numero, 'vencimiento': fechaVenc }, merge: true);
  }

  void updateRecord(int cvv, String numero, String fechaVenc) {

    Firestore.instance.collection('users').document(UserDefaults.shared.email).collection('tarjetas').document(widget.tarjeta.id)
      .updateData({ 'cvv': cvv, 'numeroTarjeta': numero, 'vencimiento': fechaVenc });
  }

}
