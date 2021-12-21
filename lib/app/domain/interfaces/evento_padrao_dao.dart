//@dart=2.9
//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:tcc/app/domain/entities/evento_padrao.dart';

abstract class EventoPadraoDAO {
  save(EventoPadrao evento_padrao);

  remove(dynamic id);

  Future<List<EventoPadrao>> find();
}
