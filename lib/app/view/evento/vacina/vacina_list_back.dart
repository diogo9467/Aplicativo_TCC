//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/services/vacina_service.dart';
import 'package:tcc/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'vacina_list_back.g.dart';

class VacinaListBack = _VacinaListBack with _$VacinaListBack;

abstract class _VacinaListBack with Store {
  var _service = GetIt.I.get<VacinaService>();

  //lista de contatos
  @observable
  Future<List<Vacina>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _VacinaListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Vacina vacina]) {
    Navigator.of(context)
        .pushNamed(MyApp.VACINA_FORM, arguments: vacina)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Vacina vacina) {
    Navigator.of(context).pushNamed(MyApp.VACINA_DETAILS, arguments: vacina);
  }

  //excluir
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
