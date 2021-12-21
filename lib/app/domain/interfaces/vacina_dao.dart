//@dart=2.9
//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:tcc/app/domain/entities/vacina.dart';

abstract class VacinaDAO {
  save(Vacina vacina);

  remove(dynamic id);

  Future<List<Vacina>> find();
}
