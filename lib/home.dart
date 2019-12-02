import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mas_roca/roca_detalle.dart';

import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'Carrito.dart';
import 'Detalles.dart';
import 'Network/BaseAuth.dart';
import 'Network/ServiceAuth.dart';
import 'Product.dart';
import 'Network/ServiceProduct.dart';

class Menu extends StatelessWidget {
  // This widget is the root of your application.
  final String userID;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  const Menu({Key key, this.userID, this.auth, this.logoutCallback}) : super(key: key);

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
  // Widget listProducts;

  @override
  initState() {
    super.initState();
  }

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
            child: 
            ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      product: Product(name: "Antipulgas", routeImg: "images/Accesorio.jpg"),
                      width: 150.0,
                    ),
                    onTap: () {}),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new GestureDetector(
                    child: PhotoHero(
                      product: Product(name: "Cupon", routeImg: "images/roca1.jpg"),
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
            child: listProducts()
            // FutureBuilder<List<Product>>(
            //   future: ServiceProduct.getProducts(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) print(snapshot.error);
            //     print(snapshot);
            //     return snapshot.hasData
            //         ? PhotosList(photos: snapshot.data)
            //         : Center(child: CircularProgressIndicator());
            //   },
            // )
          ),
        ]))),
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
  listProducts(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Productos').snapshots(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: snapshot.data.documents
                  .map((DocumentSnapshot document) {
                return new PhotoHero(
                  product: Product.fromSnapshot(document),
                  width: 150,
                );
              }).toList()
            );
        }
      },
    );
  }
}
class PhotosList extends StatelessWidget {
  final List<Product> photos;
  final String route;

  PhotosList({Key key, this.photos, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return  GestureDetector(
          child: PhotoHero(
            product: photos[index],
            width: 150.0,
          ),
          onTap: () {}
        );
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
class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key, this.onTap, this.width, this.product})
      : super(key: key);
  
  //  String tag;
  //  String ruta;
  final VoidCallback onTap;
  final double width;
  final Product product;

  Widget build(BuildContext context) {
    print(product.name);
    if(product == null ) return Text('Imagen No Encntrada');
    String tag = product.name;
    String ruta = product.routeImg;
    if(tag ==null){
      tag = "yolo";
    }
    if(ruta == null){
      ruta = "images/placeholder.jpg";
    }
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.of(context).push( MaterialPageRoute( builder: (context) {
                  return RockDetailPage(product);
                },),
            ),
            child: Image.asset(ruta),
          ),
        ),
      ),
    );
  }
}
