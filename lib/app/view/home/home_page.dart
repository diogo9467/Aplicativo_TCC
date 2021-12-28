//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, must_be_immutable, avoid_unnecessary_containers, unnecessary_string_interpolations, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tcc/app/view/calendar/calendar.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';
import 'package:intl/intl.dart';

import 'package:tcc/app/view/user/user_form.dart';

class HomePage extends StatelessWidget {
  DateTime data = DateTime.now();
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
              /*child: Center(
                  child: Text(
                "Agrobusiness:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),*/
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.docs.map((document) {
                    if (document['nome'] == '') {
                      print('erro');
                      //Colocar cadastro de nome nesse caso do nome ser nulo
                    }
                    return Container(
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
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                      top: 10,
                                                      bottom: 10,
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Olá, ',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        (document['nome']),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                    borderRadius:
                                                        BorderRadius.all(
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
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                  }).toList(),
                );
              },
            ),
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
