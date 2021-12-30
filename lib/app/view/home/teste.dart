//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, prefer_typing_uninitialized_variables, void_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  UserInformation createState() => UserInformation();
}

class UserInformation extends State<Teste> {
  Map data;
  addData() {
    Map<String, dynamic> demoData = {
      "name": "oi",
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('p');
    collectionReference.add(demoData);
  }

  getDocumentData() async {
    var collection = FirebaseFirestore.instance.collection('p');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        final dados = data['name'];
      }
    });
  }

  void getData() async {
    await for (var messages
        in FirebaseFirestore.instance.collection('p').snapshots()) {
      for (var message in messages.docs.toList()) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String dat = getDocumentData().dados;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MaterialButton(
                onPressed: addData,
                child: Row(
                  children: [
                    Text("add"),
                  ],
                )),
            MaterialButton(
                onPressed: getDocumentData,
                child: Row(
                  children: [
                    Text("coletar"),
                  ],
                )),
            MaterialButton(
                onPressed: getData,
                child: Row(
                  children: [
                    Text("coletar"),
                  ],
                )),
            Text(dat),
          ],
        ),
      ),
    );
  }
}
