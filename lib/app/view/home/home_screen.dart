//@dart=2.9
// ignore_for_file: prefer_const_constructors, unnecessary_this, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, unused_import, deprecated_member_use, unused_field, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:tcc/app/view/bar/bloc.navigation_bloc/navigation_bloc.dart';

import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list_back.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list_back.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';
import 'package:intl/intl.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list_back.dart';
import 'package:tcc/app/view/login/login_screen.dart';
import 'package:tcc/app/view/login/user_model.dart';
import 'package:tcc/app/view/user/user_form.dart';
import 'package:timezone/data/latest.dart' as tz;

class HomePage extends StatefulWidget with NavigationStates {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> with NavigationStates {
  final _back = EventoPadraoListBack();
  final _backk = VacinaListBack();
  final _backkk = CicloListBack();

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.green, onPressed: onPressed);
  }

  /*getDocumentData() async {
    var collection = FirebaseFirestore.instance.collection('eventopadrao');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        data['data'];
      }
    });
  }*/

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  DateTime data = DateTime.now();
  User user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();
  String uid;

  @override
  void initState() {
    super.initState();

    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get()
          .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());

        setState(() {});
      });
    } catch (e) {
      logout(context);
    }
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
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.green,
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.12,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Column(children: [
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                        ),
                                        child: CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/512/677/677864.png')),
                                      ),
                                    ],
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
                                                  width: 1,
                                                  color: Colors.black),
                                              color: Colors.green,
                                            ),
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
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
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
                  "Seus eventos",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            Observer(builder: (context) {
              return FutureBuilder(
                  future: _back.list,
                  builder: (context, futuro) {
                    if (!futuro.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<EventoPadrao> lista = futuro.data;
                      lista.removeWhere(
                          (e) => e.uid != AuthService.getUser().uid);
                      //lista.removeWhere((e) => e.data != dat);

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista.length,
                        itemBuilder: (context, i) {
                          var evento_padrao = lista[i];
                          return Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1.3)),
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                        radius: 27,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            'https://png.pngtree.com/png-vector/20190926/ourlarge/pngtree-schedule-glyph-icon-vector-png-image_1742916.jpg'))),
                                title: Text(evento_padrao.nome),
                                onTap: () {
                                  _back.goToDetails(context, evento_padrao);
                                },
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      iconEditButton(() {
                                        _back.goToForm(context, evento_padrao);
                                      }),
                                      iconRemoveButton(context, () {
                                        _back.remove(evento_padrao.id);
                                        Navigator.of(context).pop();
                                      })
                                    ],
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                  });
            }),
            Observer(builder: (context) {
              return FutureBuilder(
                  future: _backk.list,
                  builder: (context, futuro) {
                    if (!futuro.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Vacina> lista = futuro.data;
                      lista.removeWhere(
                          (e) => e.uid != AuthService.getUser().uid);

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista.length,
                        itemBuilder: (context, i) {
                          var vacina = lista[i];
                          return Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1.3)),
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                        radius: 27,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUw-t2Op2vTVwrq_2isyqgOotFgiyHLhGvXg&usqp=CAU'))),
                                title: Text(vacina.nome),
                                onTap: () {
                                  _backk.goToDetails(context, vacina);
                                },
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      iconEditButton(() {
                                        _backk.goToForm(context, vacina);
                                      }),
                                      iconRemoveButton(context, () {
                                        _backk.remove(vacina.id);
                                        Navigator.of(context).pop();
                                      })
                                    ],
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                  });
            }),
            Observer(builder: (context) {
              return FutureBuilder(
                  future: _backkk.list,
                  builder: (context, futuro) {
                    if (!futuro.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Ciclo> lista = futuro.data;
                      lista.removeWhere(
                          (e) => e.uid != AuthService.getUser().uid);

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista.length,
                        itemBuilder: (context, i) {
                          var ciclo = lista[i];
                          return Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1.3)),
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                        radius: 27,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            'https://simcides.com.br/wp-content/uploads/2020/06/cow2.png'))),
                                title: Text(ciclo.identificacao),
                                onTap: () {
                                  _backkk.goToDetails(context, ciclo);
                                },
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      iconEditButton(() {
                                        _backkk.goToForm(context, ciclo);
                                      }),
                                      iconRemoveButton(context, () {
                                        _back.remove(ciclo.id);
                                        Navigator.of(context).pop();
                                      })
                                    ],
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                  });
            }),
          ],
        )));
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
