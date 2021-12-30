//@dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, camel_case_types, unused_import, missing_required_param

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:tcc/app/domain/services/auth_service.dart';

import 'package:tcc/app/view/user/user_form_back.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldNome(UserFormBack back) {
    return TextFormField(
        validator: back.validateNome,
        onSaved: (newValue) => back.user.nome = newValue,
        initialValue: back.user.nome,
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

  @override
  Widget build(BuildContext context) {
    var _back = UserFormBack(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Cadastro de nome',
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
                    'Confirmar modificação',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: 483,
                ),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  OutlinedButton(
                    //                   onPressed: () => context.read<AuthService>().logout(),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.red,
                      side: BorderSide(width: 1.0, color: Colors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Logout      ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
