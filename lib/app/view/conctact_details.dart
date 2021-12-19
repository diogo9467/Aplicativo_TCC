//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:tcc/app/domain/entities/contact.dart';
import 'package:tcc/app/view/contact_details_back.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var widht = constraints.biggest.width;
        var radius = widht / 4.5;
        var radiuss = widht / 4.3;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              CircleAvatar(
                radius: radiuss,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/677/677864.png',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${contact.identificacao}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Sexo'),
                  subtitle: Text('${contact.sexo}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Raça'),
                  subtitle: Text('${contact.raca}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Data de Nascimento'),
                  subtitle: Text('${contact.data_nascimento}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Data de Aquisição'),
                  subtitle: Text('${contact.data_aquisicao}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Inicio do período de lactacao'),
                  subtitle: Text('${contact.inicio_lactacao}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
