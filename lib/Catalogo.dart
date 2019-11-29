import 'package:flutter/material.dart';
import 'roca_modelo.dart';
import 'roca_lista.dart';
import 'Drawer.dart';

void main() => runApp(Catalogo());
final naranja = new Color.fromRGBO(255, 145, 0, 1);
final azul = new Color.fromRGBO(40, 52, 150, 1);

class Catalogo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Roca Catalogo',
      color: azul,
      /*theme: ThemeData(
        //primarySwatch: Color.fromRGBO(155, 250, 208,1),
        primaryColor: azul,
        secondaryHeaderColor: naranja,
        //backgroundColor: azul, //azul
      ),*/
      home: MyHomePage(title: '+Roca Catalogo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Roca> initialRocks = []
    ..add(Roca('Ruby', 'Engrane de la Facultad de Ingenieria, UASLP',
        'Ruby es una roca que ha estado en la Facultad de Ingeniería, es una roca muy inteligente, de hecho, tiene una maestría en Rocas de la Información...',"images/roca1.jpg",130.00))
    ..add(Roca('Rex', 'Parque de Morales, San Luis Potosí', 'Rex es una roca sedentaria, le fascina correr por la mañana con los visitantes del parque, a veces, Rex sufre bullying por parte de las mascotas :(.',"images/roca2.jpg",85.50))
    ..add(Roca('Rod', 'Springfield',
        'Rod es una estrella de la televisión, se escapó de Los Simpsons para convertirse en una roca... Mentira! Nadie dejaría los Simpsons, pero apoco no te la creíste :v',"images/roca3.jpg",114.99))
    ..add(Roca('Herbert', '¿?', 'Herbert es una roca extraña, de hecho, sospechamos que no es una roca sino un bolsillo viejo y duro...',"images/roca4.jpg",99.99))
    ..add(Roca('Rocky', 'Fondo de Bikini', 'Rocky es la mascota oficial de +Roca, en realidad es la más simple pero la más valiosa',"images/roca5.jpg",499.99));

  TextStyle style = TextStyle(
      //fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Color.fromRGBO(255, 173, 65, 1));

  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Catalogo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: azul,
        ),
      body: Container(
        // Remove the DogCard Widget.
        // Instead, use your new DogList Class,
        // Pass in the mock data from the list above.
        child: Center( // Changed code
          child: RocaList(initialRocks), // Changed code
        ),
      ),
        drawer: Cajon()
    );
  }
}
