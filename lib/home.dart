import 'Drawer.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
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
                child: Column(children: <Widget>[
          Stack(children: <Widget>[
            Image.asset("images/principal.jpg"),
            Container(
                padding: EdgeInsets.fromLTRB(180, 185, 0, 0),
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Color.fromRGBO(255, 173, 64, 0.8),
                    width: 225,
                    height: 80,
                    child: Center(
                      child: Text("Oferta del día!",
                          textAlign: TextAlign.center, style: style),
                    ))),
          ]),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          new Container(
              decoration: new BoxDecoration(color: Colors.grey[50]),
              child: Text(
                'Categorias',
                style: TextStyle(
                    fontSize: 45.0,
                    color: Color.fromRGBO(40, 52, 150, 1),
                    letterSpacing: .2),
                textAlign: TextAlign.center,
              )),
          new Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      tag: "Antipulgas",
                      ruta: "images/roca2.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      tag: "Cupon",
                      ruta: "images/roca1.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
          ),
          new Container(
              decoration: new BoxDecoration(color: Colors.grey[50]),
              child: Text(
                'Productos',
                style: TextStyle(
                    fontSize: 45.0,
                    color: Color.fromRGBO(40, 52, 150, 1),
                    letterSpacing: .2),
                textAlign: TextAlign.center,
              )),
          new Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new GestureDetector(
                    child: PhotoHero(
                      tag: "Rocaa",
                      ruta: "images/roca2.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      tag: "123454",
                      ruta: "images/roca1.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      tag: "Roca",
                      ruta: "images/roca2.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      tag: "Roca4",
                      ruta: "images/roca1.jpg",
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(5.0),
                )
              ],
            ),
          ),
        ]))),
        drawer: Cajon());
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key, this.tag, this.photo, this.ruta, this.onTap, this.width})
      : super(key: key);
  final String tag;
  final String photo;
  final String ruta;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(ruta),
          ),
        ),
      ),
    );
  }
}
