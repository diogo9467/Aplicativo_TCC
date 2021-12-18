//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/contact.dart';
import 'package:tcc/app/domain/services/contact_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ContactFormBack {
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _identificationIsValid;
  bool _racaIsValid;
  bool _telefoneIsValid;

  bool get isValid =>
      _identificationIsValid && _racaIsValid && _telefoneIsValid;

  ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null)
        ? Contact(
            raca: '', id: null, identificacao: '', telefone: '', urlAvatar: '')
        : parameter;
  }

  save() async {
    await _service.save(contact);
  }

  String validateIdentification(String identification) {
    try {
      _service.validateIdentification(identification);
      _identificationIsValid = true;
      return null;
    } catch (e) {
      _identificationIsValid = false;
      return e.toString();
    }
  }

  String validateRaca(String raca) {
    try {
      _service.validateRaca(raca);
      _racaIsValid = true;
      return null;
    } catch (e) {
      _racaIsValid = false;
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
