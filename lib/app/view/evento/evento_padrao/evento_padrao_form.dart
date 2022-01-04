//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, camel_case_types, unnecessary_this, prefer_typing_uninitialized_variables, avoid_init_to_null

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form_back.dart';

class EventoPadraoForm extends StatefulWidget {
  @override
  State<EventoPadraoForm> createState() => _EventoPadraoFormState();
}

class _EventoPadraoFormState extends State<EventoPadraoForm> {
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

  Widget fieldData(EventoPadraoFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
        validator: back.validateData,
        onSaved: (newValue) => back.eventopadrao.data = newValue,
        initialValue: back.eventopadrao.data,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Data do evento',
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
              fieldData(_back),
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
