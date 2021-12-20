//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc/app/view/animals/animal_form_back_.dart';

class AnimalForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldIdentification(AnimalFormBack back) {
    return TextFormField(
        validator: back.validateIdentification,
        onSaved: (newValue) => back.animal.identificacao = newValue,
        initialValue: back.animal.identificacao,
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

  Widget fieldRaca(AnimalFormBack back) {
    return TextFormField(
        validator: back.validateRaca,
        onSaved: (newValue) => back.animal.raca = newValue,
        initialValue: back.animal.raca,
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

  Widget fieldSexo(AnimalFormBack back) {
    return TextFormField(
        validator: back.validateSexo,
        onSaved: (newValue) => back.animal.sexo = newValue,
        initialValue: back.animal.sexo,
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

  Widget fieldData_nascimento(AnimalFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateData_nascimento,
        onSaved: (newValue) => back.animal.data_nascimento = newValue,
        initialValue: back.animal.data_nascimento,
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

  Widget fieldData_aquisicao(AnimalFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateData_aquisicao,
        onSaved: (newValue) => back.animal.data_aquisicao = newValue,
        initialValue: back.animal.data_aquisicao,
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

  Widget fieldInicio_lactacao(AnimalFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateInicio_lactacao,
        onSaved: (newValue) => back.animal.inicio_lactacao = newValue,
        initialValue: back.animal.inicio_lactacao,
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
    var _back = AnimalFormBack(context);
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
