//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:tcc/app/domain/entities/contact.dart';

abstract class ContactDAO {
  save(Contact contact);

  remove(dynamic id);

  Future<List<Contact>> find();
}
