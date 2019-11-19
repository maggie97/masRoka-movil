import 'package:flutter/material.dart';
import 'roca_modelo.dart';
import 'roca_lista.dart';
import 'Drawer.dart';

void main() => runApp(Catalogo());
final naranja = new Color.fromRGBO(255, 73, 65, 1);
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
    ..add(Roca('Ruby', 'Facultad de Ingenieria, UASLP',
        'Ruby es una roca que ha estado en la Facultad de Ingenieria, es una roca muy inteligente'))
    ..add(Roca('Rex', 'Parque de Morales, SLP', 'Rex es una roca sedentaria.'))
    ..add(Roca('Rod', 'Springfield',
        'Rod es una estrella de la televisión, se escapó de Los Simpsons para convertirse en una roca.'))
    ..add(Roca('Herbert', '¿?', 'Herbert es una roca extraña, de hecho, sospechamos que no es una roca sino un bollillo viejo y duro...'))
    ..add(Roca('Rocky', 'Fondo de Bikini', 'Rocky es la mascota oficial de +Roca, simplemente la más simple pero la más valiosa'));

  TextStyle style = TextStyle(
      //fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Color.fromRGBO(255, 173, 65, 1));

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: azul,
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
