//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc/app/domain/entities/users.dart';
import 'package:tcc/app/domain/services/users_service.dart';

class UserFormBack {
  Users user;
  var _service = GetIt.I.get<UsersService>();
  bool _firstnameIsValid;

  bool get isValid => _firstnameIsValid;

  UserFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    user = (parameter == null)
        ? Users(
            firstName: '',
            id: null,
          )
        : parameter;
  }

  save() async {
    await _service.save(user);
  }

  String validateNome(String firstname) {
    try {
      _service.validatefirstName(firstname);
      _firstnameIsValid = true;
      return null;
    } catch (e) {
      _firstnameIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
