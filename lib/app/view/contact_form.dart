//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc/app/view/contact_form_back_.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contact.nome = newValue,
      initialValue: back.contact.nome,
      decoration: InputDecoration(labelText: 'Nome'),
    );
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact.email = newValue,
      initialValue: back.contact.email,
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget fieldTelefone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ########');
    return TextFormField(
      validator: back.validateTelefone,
      onSaved: (newValue) => back.contact.telefone = newValue,
      initialValue: back.contact.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Telefone', hintText: 'Formato: (xx) x xxxxxxxx'),
    );
  }

  Widget fieldURLImage(ContactFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.contact.urlAvatar = newValue,
      initialValue: back.contact.urlAvatar,
      decoration: InputDecoration(
          labelText: 'Endereço da imagem', hintText: 'Link da imagem'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
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
              fieldName(_back),
              fieldEmail(_back),
              fieldTelefone(_back),
              fieldURLImage(_back),
            ],
          ),
        ),
      ),
    );
  }
}
