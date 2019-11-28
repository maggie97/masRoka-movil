import 'package:flutter/material.dart';
import 'package:mas_roca/ServiceAuth.dart';
import 'HttpRequest.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

import 'package:mas_roca/NetworkLayer.dart';
import 'package:mas_roca/User.dart';
void main() => runApp(MyApp());
final naranja = new Color.fromRGBO(255,73,65,1); // 40, 52, 150 azul ----- 255, 173, 65 naranja
final azul = new Color.fromRGBO(40,52,150,1); // 40, 52, 150 azul ----- 255, 173, 65 naranja
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Roca Login',
      theme: ThemeData(
        //primarySwatch: Color.fromRGBO(155, 250, 208,1),
        primaryColor: Color.fromRGBO(255, 173, 65, 1), // 40, 52, 150 azul ----- 255, 173, 65 naranja
        secondaryHeaderColor: Color.fromRGBO(255, 173, 65, 1),
        backgroundColor: Color.fromRGBO(40, 52, 150, 1),//azul
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
  Future<User> user;
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Color.fromRGBO(255, 173, 65, 1));

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final email = TextEditingController();
  final contrasenia = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
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
            color: naranja, // 40, 52, 150 azul ----- 255, 173, 65 naranja
          ),

          hintStyle: TextStyle(color: naranja),
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
          hintStyle: TextStyle(color: naranja),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: naranja,
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: naranja,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width-100,
        padding: EdgeInsets.fromLTRB(
            20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
        onPressed: () {
          
          // var url = 'https://masrocka.herokuapp.com/api/User';
          // NetworkLayer.request(url , HttpRequest.post , (response){
          //   print('${response.statusCode}');
          // });
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
          } else 
          // if (cpEmail == cpPass && cpEmail == "admin") 
          {
            mensaje = "";
            //TODO: implements the login correctly
            print('send');
            ServiceAuth.login(cpEmail, cpPass, (statusCode){
              print('object');
              if (statusCode > 400){
                mensaje = "Login failed wrong user credentials";
                ink = Colors.red;
                return;
              }
              mensaje = "Congratulations! You're a f*cking hacker :v";
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            });
            ink = Colors.green;

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
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final registrarButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: naranja,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width-100,
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
                color: Colors.white,
                fontWeight: FontWeight.bold)),
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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: CircleAvatar(
                    radius: 300,
                    backgroundColor: Colors.orange,
                    child: ClipOval(
                      child: Image.network(
                        "https://picsum.photos/300/300?nature",
                      ),
                    ),
                  ),
                )
              ),
              Card(
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color.fromRGBO(255, 255, 255, 0.5),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 15.0), //36.0
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
            ],
          ),

        ));
  }
}
