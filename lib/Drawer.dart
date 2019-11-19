import 'package:flutter/material.dart';
import 'package:mas_roca/Catalogo.dart';
import 'home.dart';
class Cajon extends StatelessWidget {

  Cajon();
  TextStyle style = TextStyle(
      fontSize: 25.0,
      color: Colors.white,
      fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Color.fromRGBO(40, 52, 150, 1),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
          ),

          ListTile(
            leading: Icon(Icons.account_circle,color: Colors.white,size: 30,),
            title: Text('Perfil',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {

            },
          ),

          ListTile(
            leading: Icon(Icons.home,color: Colors.white,size: 30,),
            title: Text('Inicio',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );

            },
          ),


          ListTile(
            leading: Icon(Icons.shopping_basket,color: Colors.white,size: 30,),
            title: Text('Catalogo',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Catalogo()),
              );
            },
          ),



          ListTile(
            title: Text('             Accesorios',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('             Rocas',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.white,size: 30,),
            title: Text('Preferencias',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {

            },
          ),

          ListTile(
            leading: Icon(Icons.close,color: Colors.white,size: 30,),
            title: Text('Cerrar sesión',
              style: style,
              textAlign: TextAlign.left,),
            onTap: () {

            },
          ),

        ],
      ),
        ),
    );

  }

}