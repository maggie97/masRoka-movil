import 'Drawer.dart';
import 'ConfirmaPago.dart';
import 'package:flutter/material.dart';

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
                  Padding(
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
                                              Container(
                                                padding:  const EdgeInsets.fromLTRB(10,0,0,0),
                                                child:Image.asset("images/roca3.jpg", width: 100, height: 100,alignment:Alignment.centerLeft,),
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,15,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child:Text("Roca Colors",style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,45,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Cantidad: 1 ",style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,65,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Precio: \$ 10.99",style: TextStyle(fontSize: 17.5, color: Colors.grey[700]))
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(0, 0, 0,0),
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
                                                      onPressed: () {
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
                                    )
                                  ]
                              )
                          )
                      ),

                    ),
                  ),
                  Padding(
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
                                              Container(
                                                padding:  const EdgeInsets.fromLTRB(10,0,0,0),
                                                child:Image.asset("images/roca1.jpg", width: 100, height: 100,alignment:Alignment.centerLeft,),
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,15,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child:Text("Roca Reggae",style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,45,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Cantidad: 2 ",style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,65,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Precio: \$ 3.99",style: TextStyle(fontSize: 17.5, color: Colors.grey[700]))
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(0, 0, 0,0),
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
                                                      onPressed: () {
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
                                    )
                                  ]
                              )
                          )
                      ),

                    ),
                  ),
                  Padding(
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
                                              Container(
                                                padding:  const EdgeInsets.fromLTRB(10,0,0,0),
                                                child:Image.asset("images/roca4.png", width: 100, height: 100,alignment:Alignment.centerLeft,),
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,15,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child:Text("Rocky",style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,45,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Cantidad: 1 ",style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,65,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Precio: \$ 999.99",style: TextStyle(fontSize: 17.5, color: Colors.grey[700]))
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(0, 0, 0,0),
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
                                                      onPressed: () {
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
                                    )
                                  ]
                              )
                          )
                      ),

                    ),
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
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(100,8,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("\$ 1,014.97‬",style: TextStyle(fontSize: 30, color: Colors.grey[700], fontWeight: FontWeight.bold))
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmaP()),
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
