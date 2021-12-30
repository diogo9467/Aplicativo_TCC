// ignore_for_file: prefer_const_constructors, unnecessary_this, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:tcc/app/view/calendar/calendar.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';
import 'package:intl/intl.dart';
import 'package:tcc/app/view/login/login_screen.dart';
import 'package:tcc/app/view/login/user_model.dart';
import 'package:tcc/app/view/user/user_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime data = DateTime.now();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Agrobusiness',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.green,
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/512/677/677864.png')),
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              top: 10,
                                              bottom: 10,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Olá, ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                ("${loggedInUser.firstName} ${loggedInUser.secondName}"),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                width: 1, color: Colors.black),
                                            color: Colors.green,
                                          ),

                                          // ignore: deprecated_member_use
                                          child: FlatButton(
                                            child: Text(
                                              'Editar informações',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserForm()));
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.bottomRight,
              child: Column(
                children: <Widget>[
                  Text(
                    DateFormat('dd/MM/yyyy').format(data),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.green,
                ),
                child: Text(
                  "Eventos diários:",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            SizedBox(
              height: 360,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.0025,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.green),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/ti/vetor-gratis/p1/582034-ilustracao-em-icone-calendario-gr%C3%A1tis-vetor.jpg')),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Calendar()));
          },
          heroTag: null,
        ),
        FloatingActionButton(
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/677/677864.png')),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AnimalList()));
          },
          heroTag: null,
        ),
        FloatingActionButton(
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUw-t2Op2vTVwrq_2isyqgOotFgiyHLhGvXg&usqp=CAU')),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => VacinaList()));
          },
          heroTag: null,
        ),
        FloatingActionButton(
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://png.pngtree.com/png-vector/20190926/ourlarge/pngtree-schedule-glyph-icon-vector-png-image_1742916.jpg')),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventoPadraoList()));
          },
          heroTag: null,
        ),
        FloatingActionButton(
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://simcides.com.br/wp-content/uploads/2020/06/cow2.png')),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CicloList()));
          },
          heroTag: null,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
