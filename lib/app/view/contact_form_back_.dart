//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:agenda/app/domain/entities/contact.dart';
import 'package:agenda/app/domain/services/contact_services.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back_.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  @action
  bool get isValid => _nameIsValid && _emailIsValid && _telefoneIsValid;

  _ContactFormBack(BuildContext context) {
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
      _service.validateName(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validateTelefone(String telefone) {
    try {
      _service.validateName(telefone);
      _telefoneIsValid = true;
      return null;
    } catch (e) {
      _telefoneIsValid = false;
      return e.toString();
    }
  }
}
