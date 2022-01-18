//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, camel_case_types, avoid_init_to_null, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/evento/vacina/vacina_form_back.dart';

class VacinaForm extends StatefulWidget {
  @override
  State<VacinaForm> createState() => _VacinaFormState();
}

class _VacinaFormState extends State<VacinaForm> {
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

  void refreshData() {}

  void onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  Widget fieldNome(VacinaFormBack back) {
    return TextFormField(
        validator: back.validateNome,
        onSaved: (newValue) => back.vacina.nome = newValue,
        initialValue: back.vacina.nome,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Nome da vacina',
        ));
  }

  Widget fieldIdentificacao(VacinaFormBack back) {
    return TextFormField(
        validator: back.validateIdentificacao,
        onSaved: (newValue) => back.vacina.identificacao = newValue,
        initialValue: back.vacina.identificacao,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Nome do animal em que será aplicado',
        ));
  }

  Widget fieldUlt_aplicacao(VacinaFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateUlt_aplicacao,
        onSaved: (newValue) => back.vacina.ult_aplicacao = newValue,
        initialValue: back.vacina.ult_aplicacao,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Ultima aplicacao',
        ));
  }

  Widget fieldIntervalo_doses(VacinaFormBack back) {
    return TextFormField(
        validator: back.validateIntervalo_doses,
        onSaved: (newValue) => back.vacina.intervalo_doses = newValue,
        initialValue: back.vacina.intervalo_doses,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Intervalo entre doses em dias',
        ));
  }

  Widget fieldQuant_doses(VacinaFormBack back) {
    return TextFormField(
        validator: back.validateQuant_doses,
        onSaved: (newValue) => back.vacina.quant_doses = newValue,
        initialValue: back.vacina.quant_doses,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Quantidade de doses',
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = VacinaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Vacina',
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
              fieldIdentificacao(_back),
              SizedBox(
                height: 25,
              ),
              fieldUlt_aplicacao(_back),
              SizedBox(height: 25),
              fieldIntervalo_doses(_back),
              SizedBox(height: 25),
              fieldQuant_doses(_back),
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
                    'Confirmar',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
