import 'Drawer.dart';
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
                    padding: EdgeInsets.all(12.0),
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
                                          child:Image.asset("images/roca1.jpg", width: 130, height: 130,alignment:Alignment.centerLeft,),
                                        ),
                                        Container(
                                            padding:  const EdgeInsets.fromLTRB(150,15,0,0),
                                            alignment: Alignment.topCenter,
                                            child:Text("Roca Reggae",style: TextStyle(fontSize: 27.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                        ),
                                        Container(
                                            padding:  const EdgeInsets.fromLTRB(150,50,0,0),
                                            alignment: Alignment.topCenter,

                                            child:Text("Cantidad: 2 ",style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                        ),
                                        Container(
                                            padding:  const EdgeInsets.fromLTRB(150,80,0,0),
                                            alignment: Alignment.topCenter,

                                            child:Text("Precio: \$ 3.99",style: TextStyle(fontSize: 22.5, color: Colors.grey[700], fontWeight: FontWeight.bold))
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
                                              width: 100,
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
                                            width: 220,
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
                    padding: EdgeInsets.all(12.0),
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
                                                child:Image.asset("images/roca1.jpg", width: 130, height: 130,alignment:Alignment.centerLeft,),
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,15,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child:Text("Roca Reggae",style: TextStyle(fontSize: 27.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,50,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Cantidad: 2 ",style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,80,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Precio: \$ 3.99",style: TextStyle(fontSize: 22.5, color: Colors.grey[700], fontWeight: FontWeight.bold))
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
                                                  width: 100,
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
                                                  width: 220,
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
                    padding: EdgeInsets.all(12.0),
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
                                                child:Image.asset("images/roca1.jpg", width: 130, height: 130,alignment:Alignment.centerLeft,),
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,15,0,0),
                                                  alignment: Alignment.topCenter,
                                                  child:Text("Roca Reggae",style: TextStyle(fontSize: 27.5, color: Colors.grey[900], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,50,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Cantidad: 2 ",style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold))
                                              ),
                                              Container(
                                                  padding:  const EdgeInsets.fromLTRB(150,80,0,0),
                                                  alignment: Alignment.topCenter,

                                                  child:Text("Precio: \$ 3.99",style: TextStyle(fontSize: 22.5, color: Colors.grey[700], fontWeight: FontWeight.bold))
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
                                                  width: 100,
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
                                                  width: 220,
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
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
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
