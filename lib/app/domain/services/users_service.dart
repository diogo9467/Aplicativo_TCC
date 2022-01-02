//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/users.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc/app/domain/interfaces/users_dao.dart';

class UsersService {
  var _dao = GetIt.I.get<UsersDAO>();

  save(Users users) {
    validatefirstName(users.firstName);
    validateemail(users.email);
    validatesecondName(users.secondName);
    validateuid(users.uid);

    _dao.save(users);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Users>> find() {
    return _dao.find();
  }

  validatefirstName(String firstName) {
    if (firstName == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validatesecondName(String secondName) {
    if (secondName == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validateemail(String email) {
    if (email == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validateuid(String uid) {
    if (uid == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }
}
