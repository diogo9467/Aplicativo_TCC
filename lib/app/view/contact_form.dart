//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tcc/app/view/contact_form_back_.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldIdentification(ContactFormBack back) {
    return TextFormField(
      validator: back.validateIdentification,
      onSaved: (newValue) => back.contact.identificacao = newValue,
      initialValue: back.contact.identificacao,
      decoration: InputDecoration(labelText: 'Identificação do animal'),
    );
  }

  Widget fieldRaca(ContactFormBack back) {
    return TextFormField(
      validator: back.validateRaca,
      onSaved: (newValue) => back.contact.raca = newValue,
      initialValue: back.contact.raca,
      decoration: InputDecoration(labelText: 'Raca'),
    );
  }

  Widget fieldSexo(ContactFormBack back) {
    return TextFormField(
      validator: back.validateSexo,
      onSaved: (newValue) => back.contact.sexo = newValue,
      initialValue: back.contact.sexo,
      decoration: InputDecoration(labelText: 'Sexo'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Cadastro de Animal',
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save, color: Colors.green),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldIdentification(_back),
              fieldRaca(_back),
              fieldSexo(_back),
            ],
          ),
        ),
      ),
    );
  }
}
