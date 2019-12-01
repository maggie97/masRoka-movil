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
                  getCardList(),
                  Button_CornerRadius(text: 'Button',color: Colors.red),
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
        print(snapshot);
        return snapshot.hasData
            ? TarjetaList(card: snapshot.data)
            : Center(child: CircularProgressIndicator());
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
    print(card.length);
    return ListView.builder(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1,
      // ),
      shrinkWrap: true,
      itemCount: card.length,
      itemBuilder: (context, index) {
        print(index);
        print(card[index].numero);
        return  
        // GestureDetector(
          // child: 
          CustomCard(
            tarjeta: card[index],
            // width: 50.0,
          );
          // onTap: () {}
          // child: Text(card[index].numero),
        // );
      },
    );
  }
  String guardImagen(String route){
    if(route == null){
      return "images/placeholder.jpg";
    }
    return route;
  }
}
class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.tarjeta, this.width}): super(key: key);

  final Tarjeta tarjeta;
  final double width;

  Widget build(BuildContext context) {
    int length = tarjeta.numero.length;
    String lastNumbers = tarjeta.numero[length-3]+tarjeta.numero[length-2]+tarjeta.numero[length-1];
    return 
    // SizedBox(
      // width: width,
      // height: 200,
      // child: 
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          // width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(
              Radius.circular(10.0) //         <--- border radius here
          )),
          child: Padding(
              padding:  const EdgeInsets.fromLTRB(0,0,0,0),
              child: Container(
                  child:  Column( children: <Widget>[
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
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(0, 20, 0,0),
                          child:Container(
                              child:Stack(
                                  children: <Widget>[
                                    Button_CornerRadius(text: 'Button',),
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
      // ),
    );
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
      _width = (MediaQuery.of(context).size.width/3) as double;

    return Container(
      // alignment: Alignment.topRight,
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