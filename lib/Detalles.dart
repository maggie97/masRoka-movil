import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'package:mas_roca/Carrito.dart';
class Detalles extends StatelessWidget {
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
    );
  }
}

class DetailScreen2 extends StatelessWidget {

  const DetailScreen2({Key key, this.ruta, this.descripcion, this.precio,this.caracteris})
      : super(key: key);
  final String descripcion;
  final String ruta;
  final String caracteris;
  final String precio;

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
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    descripcion,
                    style: TextStyle(fontSize: 30.0, color: Color.fromRGBO(255, 173, 65, 1),fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Center(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.asset(
                          ruta,
                          width: 400.0,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text("Descripción: ",style: TextStyle(fontSize: 25, color: Colors.grey[800], fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  Text(caracteris,style: TextStyle(fontSize: 25, color: Colors.grey[600], fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text("Precio por unidad: ",style: TextStyle(fontSize: 22.5, color: Colors.grey[900], fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Text("\$"+precio+".00 MXN",style: TextStyle(fontSize: 22.5, color: Colors.grey[600], fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                    child: Material(  //Wrap with Material
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                      elevation: 18.0,
                      color: Color.fromRGBO(255, 173, 65, 1),
                      clipBehavior: Clip.antiAlias, // Add This
                      child: MaterialButton(
                        minWidth: 250.0,
                        height: 50,
                        color:  Color.fromRGBO(255, 173, 65, 1),
                        child: new Text('Agregar al carrito',
                            style: new TextStyle(fontSize: 30.0, color: Colors.white)),
                        onPressed: () {
                        },
                      ),
                    ),
                  ),

                ])
            )
        ),
      drawer: Cajon(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Carrito()),
          );
        },
        label: Text(""),
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 40.0,
        ),
        backgroundColor: Color.fromRGBO(255, 173, 65, .8),),
    );

  }


}
