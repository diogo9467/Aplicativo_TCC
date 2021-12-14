//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:agenda/app/domain/entities/contact.dart';
import 'package:agenda/app/domain/services/contact_services.dart';
import 'package:agenda/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact>> list;
  @action
  refreshList([dynamic valu1e]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }
  goToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList);
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
