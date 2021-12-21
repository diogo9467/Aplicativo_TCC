//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:tcc/app/view/evento/ciclo_form.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form.dart';

import 'package:tcc/app/view/evento/vaccine_form.dart';

class Event_form extends StatelessWidget {
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
          'Cadastro de eventos',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ciclo_form()));
                  },
                  child: Text('Evento de ciclo reprodutivo')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Vaccine_form()));
                  },
                  child: Text('Evento de vacinação')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventoPadraoForm()));
                  },
                  child: Text('Evento padrão')),
            ],
          )
        ],
      ),
    );
  }
}
