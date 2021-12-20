//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc/app/view/contact_form_back_.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldIdentification(ContactFormBack back) {
    return TextFormField(
        validator: back.validateIdentification,
        onSaved: (newValue) => back.contact.identificacao = newValue,
        initialValue: back.contact.identificacao,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Identificação do animal',
        ));
  }

  Widget fieldRaca(ContactFormBack back) {
    return TextFormField(
        validator: back.validateRaca,
        onSaved: (newValue) => back.contact.raca = newValue,
        initialValue: back.contact.raca,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Raça',
        ));
  }

  Widget fieldSexo(ContactFormBack back) {
    return TextFormField(
        validator: back.validateSexo,
        onSaved: (newValue) => back.contact.sexo = newValue,
        initialValue: back.contact.sexo,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Sexo',
        ));
  }

  Widget fieldData_nascimento(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateData_nascimento,
        onSaved: (newValue) => back.contact.data_nascimento = newValue,
        initialValue: back.contact.data_nascimento,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Data de Nascimento',
        ));
  }

  Widget fieldData_aquisicao(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateData_aquisicao,
        onSaved: (newValue) => back.contact.data_aquisicao = newValue,
        initialValue: back.contact.data_aquisicao,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Data de Aquisição',
        ));
  }

  Widget fieldInicio_lactacao(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateInicio_lactacao,
        onSaved: (newValue) => back.contact.inicio_lactacao = newValue,
        initialValue: back.contact.inicio_lactacao,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Inicio periodo de lactação',
        ));
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldIdentification(_back),
              SizedBox(height: 25),
              fieldRaca(_back),
              SizedBox(height: 25),
              fieldSexo(_back),
              SizedBox(height: 25),
              fieldData_nascimento(_back),
              SizedBox(height: 25),
              fieldData_aquisicao(_back),
              SizedBox(height: 25),
              fieldInicio_lactacao(_back),
            ],
          ),
        ),
      ),
    );
  }
}
