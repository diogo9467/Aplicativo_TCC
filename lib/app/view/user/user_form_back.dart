/*//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/users.dart';
import 'package:tcc/app/domain/services/user_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class UserFormBack {
  User user;
  var _service = GetIt.I.get<UserService>();
  bool _nomeIsValid;

  bool get isValid => _nomeIsValid;

  UserFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    user = (parameter == null)
        ? User(
            firstName: '',
            id: null,
          )
        : parameter;
  }

  save() async {
    await _service.save(user);
  }

  String validateNome(String nome) {
    try {
      _service.validateNome(nome);
      _nomeIsValid = true;
      return null;
    } catch (e) {
      _nomeIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
*/