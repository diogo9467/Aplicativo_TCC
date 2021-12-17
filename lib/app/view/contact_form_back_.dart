//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/contact.dart';
import 'package:tcc/app/domain/services/contact_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ContactFormBack {
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  bool get isValid => _nameIsValid && _emailIsValid && _telefoneIsValid;

  ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null)
        ? Contact(email: '', id: null, nome: '', telefone: '', urlAvatar: '')
        : parameter;
  }

  save() async {
    await _service.save(contact);
  }

  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateEmail(String email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validateTelefone(String telefone) {
    try {
      _service.validatePhone(telefone);
      _telefoneIsValid = true;
      return null;
    } catch (e) {
      _telefoneIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
