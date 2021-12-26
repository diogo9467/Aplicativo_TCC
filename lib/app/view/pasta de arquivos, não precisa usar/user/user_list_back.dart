//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc/app/domain/entities/user.dart';
import 'package:tcc/app/domain/services/user_service.dart';
import 'package:tcc/app/my_app.dart';

part 'user_list_back.g.dart';

class UserListBack = _UserListBack with _$UserListBack;

abstract class _UserListBack with Store {
  var _service = GetIt.I.get<UserService>();

  //lista de contatos
  @observable
  Future<List<User>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _UserListBack() {
    refreshList();
  }
  goToForm(BuildContext context, [User user]) {
    Navigator.of(context)
        .pushNamed(MyApp.USER_FORM, arguments: user)
        .then(refreshList);
  }
}
