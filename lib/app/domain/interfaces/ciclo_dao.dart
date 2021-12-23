//@dart=2.9
//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:tcc/app/domain/entities/ciclo.dart';

abstract class CicloDAO {
  save(Ciclo ciclo);

  remove(dynamic id);

  Future<List<Ciclo>> find();
}
