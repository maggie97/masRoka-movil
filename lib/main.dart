import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());
final naranja = new Color.fromRGBO(
    255, 73, 65, 1); // 40, 52, 150 azul ----- 255, 173, 65 naranja
final naranja2 = new Color.fromRGBO(255, 145, 0, 1);
final azul = new Color.fromRGBO(
    40, 52, 150, 1); // 40, 52, 150 azul ----- 255, 173, 65 naranja

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Roca Login',
      theme: ThemeData(
        //primarySwatch: Color.fromRGBO(155, 250, 208,1),
        primaryColor: Color.fromRGBO(
            255, 173, 65, 1), // 40, 52, 150 azul ----- 255, 173, 65 naranja
        secondaryHeaderColor: Color.fromRGBO(255, 173, 65, 1),
        backgroundColor: Color.fromRGBO(40, 52, 150, 1), //azul
      ),
      home: MyHomePage(title: '+Roca Login'),
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
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Color.fromRGBO(255, 173, 65, 1));

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final email = TextEditingController();
  final contrasenia = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    contrasenia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration(
      color: Colors.black,
    );
    final emailField = TextField(
      controller: email,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          labelText: "Email",
          prefixIcon: Icon(
            Icons.mail_outline,
            color: naranja2, // 40, 52, 150 azul ----- 255, 173, 65 naranja
          ),
          hintStyle: TextStyle(color: naranja2),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: contrasenia,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          labelText: "Password",
          hintStyle: TextStyle(color: naranja2),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: naranja2,
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: naranja2,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 100,
        padding: EdgeInsets.fromLTRB(
            20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
        onPressed: () {
          String cpPass = contrasenia.text;
          String cpEmail = email.text;
          Color ink = Colors.amber;
          String mensaje;
          if (cpEmail.isEmpty && cpPass.isEmpty) {
            mensaje = "Please enter a valid information!";
          } else if (cpPass.isEmpty && cpEmail.isNotEmpty) {
            mensaje = "The password field can't be empty";
          } else if (cpEmail.isEmpty && cpPass.isNotEmpty) {
            mensaje = "The email field can't be empty";
          } else if (cpEmail == cpPass && cpEmail == "admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );

            /*mensaje = "Congratulations! You're a f*cking hacker :v";
            ink = Colors.green;*/
          } else {
            mensaje = "Login failed wrong user credentials";
            ink = Colors.red;
          }
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(mensaje,
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: ink,
            duration: Duration(seconds: 2),
          ));
        },
        child: Text("Acceder",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final registrarButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: naranja2,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 100,
        padding: EdgeInsets.fromLTRB(
            20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
        onPressed: () {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Todavia no tengo la parte del registro amigos :'v",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.black12,
            duration: Duration(seconds: 2),
          ));
        },
        child: Text("Registrar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: azul,
        /*appBar: AppBar(
            centerTitle: true,
            title: Text(
              "+Roca Login",
              style: TextStyle(color: Color.fromRGBO(57, 52, 36, 1)),
            )),*/
        // 40, 52, 150 azul ----- 255, 173, 65 naranja
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 250),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        20.0, 80.0, 20.0, 15.0), //36.0
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                        registrarButton,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://picsum.photos/300/300?nature',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
