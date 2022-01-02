//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:tcc/app/domain/entities/evento_padrao.dart';

abstract class EventoPadraoDAO {
  save(EventoPadrao eventoPadrao);

  remove(dynamic id);

  Future<List<EventoPadrao>> find();
}
