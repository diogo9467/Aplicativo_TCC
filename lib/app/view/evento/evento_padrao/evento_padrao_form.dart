//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form_back.dart';

class EventoPadraoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldNome(EventoPadraoFormBack back) {
    return TextFormField(
        validator: back.validateNome,
        onSaved: (newValue) => back.eventopadrao.nome = newValue,
        initialValue: back.eventopadrao.nome,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Nome',
        ));
  }

  Widget fieldObservacao(EventoPadraoFormBack back) {
    return TextFormField(
        validator: back.validateObservacao,
        onSaved: (newValue) => back.eventopadrao.observacao = newValue,
        initialValue: back.eventopadrao.observacao,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Observacao',
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = EventoPadraoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Cadastro de evento padrão',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldNome(_back),
              SizedBox(height: 25),
              fieldObservacao(_back),
              SizedBox(height: 25),
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    _form.currentState.validate();
                    _form.currentState.save();
                    if (_back.isValid) {
                      _back.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Confirmar cadastro',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}