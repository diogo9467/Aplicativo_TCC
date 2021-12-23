//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/domain/services/ciclo_service.dart';

import 'package:tcc/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'ciclo_list_back.g.dart';

class CicloListBack = _CicloListBack with _$CicloListBack;

abstract class _CicloListBack with Store {
  var _service = GetIt.I.get<CicloService>();

  //lista de contatos
  @observable
  Future<List<Ciclo>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _CicloListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Ciclo ciclo]) {
    Navigator.of(context)
        .pushNamed(MyApp.CICLO_FORM, arguments: ciclo)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Ciclo ciclo) {
    Navigator.of(context).pushNamed(MyApp.CICLO_DETAILS, arguments: ciclo);
  }

  //excluir
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
