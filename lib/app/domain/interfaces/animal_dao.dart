//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:tcc/app/domain/entities/animal.dart';

abstract class AnimalDAO {
  save(Animal animal);

  remove(dynamic id);

  Future<List<Animal>> find();
}
