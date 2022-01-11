//@dart=2.9

// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:tcc/app/domain/entities/users.dart';

abstract class UsersDAO {
  save(Users users);

  remove(dynamic id);

  Future<List<Users>> find();
}
