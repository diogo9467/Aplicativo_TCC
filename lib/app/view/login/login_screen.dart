// ignore_for_file: prefer_const_constructors, avoid_print, import_of_legacy_library_into_null_safe, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tcc/app/view/bar/sidebar/sidebar_layout.dart';

import 'package:tcc/app/view/login/registration_screen.dart';
import 'package:tcc/app/view/login/reset.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //toggle da visibilidade da senha
  bool _isHidePassword = true;
  _toggleHidePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // String para mostrar a mensagem de erro
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //Campo do email
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor coloque seu email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor coloque um email valido");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email:",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Campo da senha
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: _isHidePassword,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("A senha é necessária para o login");
          }
          if (!regex.hasMatch(value)) {
            return ("A deve possuir no mínimo 6 caracteres");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Senha:",
          suffixIcon: IconButton(
            icon:
                Icon(_isHidePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () => _toggleHidePassword(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    /*Get.snackbar(
                                'Loading...',
                                'Please wait.',
                                backgroundColor: Colors.black,
                                colorText: Colors.white,
                                showProgressIndicator: true,
                              );*/

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 83,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/677/677864.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 35),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              "Cadestre-se agora",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPage()));
                            },
                            child: Text(
                              'Alterar a senha',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Função de login
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login bem sucessido"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SideBarLayout())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Seu email está mal formulado";

            break;
          case "wrong-password":
            errorMessage = "Senha incorreta";
            break;
          case "user-not-found":
            errorMessage = "Email não existe";
            break;
          case "user-disabled":
            errorMessage = "Esse email foi desativado";
            break;
          case "too-many-requests":
            errorMessage =
                "Você realizou muitas tentativas, espere-se e tente novamente";
            break;
          case "operation-not-allowed":
            errorMessage = "Operação não permitida";
            break;
          default:
            errorMessage = "Um erro inesperado aconteceu";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
