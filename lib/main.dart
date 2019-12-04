import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mas_roca/Network/BaseAuth.dart';
import 'package:mas_roca/Network/UserDefaults.dart';
import 'Network/ServiceAuth.dart';
import 'Registro.dart';
import 'home.dart';
import 'RootView.dart';

import 'package:mas_roca/User.dart';
void main() => runApp(Inicio());
final naranja = new Color.fromRGBO(255,73,65,1); // 40, 52, 150 azul ----- 255, 173, 65 naranja
final naranja2 = new Color.fromRGBO(255, 145, 0, 1);
final azul = new Color.fromRGBO(40,52,150,1); // 40, 52, 150 azul ----- 255, 173, 65 naranja


class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage());
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final BaseAuth auth;
  final VoidCallback loginCallback;

  const MyApp({Key key, this.auth, this.loginCallback}) : super(key: key);
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
      home: MyHomePage(title: '+Roca Login', auth: auth,loginCallback: loginCallback,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.auth, this.loginCallback}) : super(key: key);
  final String title;
  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = new GlobalKey<FormState>();
  Future<User> user;
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Color.fromRGBO(255, 173, 65, 1));

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final email = TextEditingController();
  final contrasenia = TextEditingController();
  
  bool _isLoginForm;
  bool _isLoading;
  String _errorMessage;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {

    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  void validateAndSubmit(String _email, String _password) async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          // ServiceAuth.login(_email, _password, (response) async {
          //   if(response < 400){
              userId = await widget.auth.signIn(_email, _password);
              UserDefaults.shared.userId = userId;
              UserDefaults.shared.email = _email;
              if (UserDefaults.shared.userId.length > 0 && UserDefaults.shared.userId  != null) {
                // UserDefaults.shared.userId = userId;
                widget.loginCallback();
              }
              //  widget.loginCallback();
            // }
            // else {
            //   _errorMessage = 'Datos erroneos';
            // }
          // }
          // );
          
        } 
        setState(() {
          _isLoading = false;
        });

        
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    contrasenia.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
   
  }

  void toggleFormMode() {
    // resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
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
        minWidth: MediaQuery.of(context).size.width-100,
        padding: EdgeInsets.fromLTRB(
            20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
        onPressed: () {
          String cpPass = contrasenia.text;
          String cpEmail = email.text;
          Color ink = Colors.amber;
          if (cpEmail.isEmpty && cpPass.isEmpty) {
            scafoldShow("Please enter a valid information!", ink);
          } else if (cpPass.isEmpty && cpEmail.isNotEmpty) {
            scafoldShow("The password field can't be empty", ink);
          } else if (cpEmail.isEmpty && cpPass.isNotEmpty) {
            scafoldShow("The email field can't be empty", ink);
          } else 
          {
            validateAndSubmit(cpEmail, cpPass);
            
          } 
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
      color: naranja2,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width-100,
        padding: EdgeInsets.fromLTRB(
            20.0, 15.0, 20.0, 15.0), //izq. arriba, derecha, abajo
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Registro()),
          );
        },
        child: Text("Registrar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    final showForm =
     Form(
      key: _formKey,
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
                    child: showForm
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
  scafoldShow(String mensaje, Color ink){
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(mensaje,
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: ink,
      duration: Duration(seconds: 2),
    ));
  }
  
  
}
