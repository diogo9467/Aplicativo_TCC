//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, camel_case_types, unnecessary_this, avoid_init_to_null

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_form_back.dart';

class CicloForm extends StatefulWidget {
  @override
  State<CicloForm> createState() => _CicloFormState();
}

class _CicloFormState extends State<CicloForm> {
  final _form = GlobalKey<FormState>();

  var user = FirebaseAuth.instance.currentUser;

  User loggedInUser = null;
  EventoPadrao event = EventoPadrao();

  @override
  void initState() {
    super.initState();
    try {
      this.loggedInUser = AuthService.getUser();

      setState(() {});
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Widget fieldIdentificacao(CicloFormBack back) {
    return TextFormField(
        validator: back.validateIdentificacao,
        onSaved: (newValue) => back.ciclo.identificacao = newValue,
        initialValue: back.ciclo.identificacao,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Identificacao',
        ));
  }

  Widget fieldUltimoCio(CicloFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateUltimoCio,
        onSaved: (newValue) => back.ciclo.ultimo_cio = newValue,
        initialValue: back.ciclo.ultimo_cio,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Ultimo Cio:',
        ));
  }

  Widget fieldDia_cio(CicloFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateDia_cio,
        onSaved: (newValue) => back.ciclo.dia_cio = newValue,
        initialValue: back.ciclo.dia_cio,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Dia do próximo cio:',
        ));
  }

  Widget fieldUltimaCria(CicloFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateUltimaCria,
        onSaved: (newValue) => back.ciclo.ultima_cria = newValue,
        initialValue: back.ciclo.ultima_cria,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Dia da última cria',
        ));
  }

  Widget fieldDia_cria(CicloFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateDia_cria,
        onSaved: (newValue) => back.ciclo.dia_cria = newValue,
        initialValue: back.ciclo.dia_cria,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Dia do próximo cio se o animal tenha tido cria',
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = CicloFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Cadastro de ciclos reprodutivos',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldIdentificacao(_back),
              SizedBox(height: 25),
              fieldUltimoCio(_back),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(),
                height: 60,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Text(
                    "Recomendamos que caso o animal não tenha tido cria recentemente o período entre cios seja considerado 22 dias "),
              ),
              SizedBox(height: 25),
              fieldDia_cio(_back),
              SizedBox(height: 25),
              fieldUltimaCria(_back),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(),
                height: 60,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Text(
                    " Recomendamos que caso o animal não tenha tido cria recentemente o período entre cios seja considerado 22 dias. "),
              ),
              SizedBox(height: 25),
              fieldDia_cria(_back),
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
