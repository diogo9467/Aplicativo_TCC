//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/user.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:tcc/app/domain/interfaces/user_dao.dart';
import 'package:get_it/get_it.dart';

class UserService {
  var _dao = GetIt.I.get<UserDAO>();

  save(User user) {
    validateNome(user.firstName);

    _dao.save(user);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<User>> find() {
    return _dao.find();
  }

  validateNome(String firstName) {
    if (firstName == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }
}
