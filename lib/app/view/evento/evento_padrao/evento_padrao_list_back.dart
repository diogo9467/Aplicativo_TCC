//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/evento_padrao_service.dart';

import 'package:tcc/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'evento_padrao_list_back.g.dart';

class EventoPadraoListBack = _EventoPadraoListBack with _$EventoPadraoListBack;

abstract class _EventoPadraoListBack with Store {
  var _service = GetIt.I.get<EventoPadraoService>();

  @observable
  Future<List<EventoPadrao>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _EventoPadraoListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [EventoPadrao eventoPadrao]) {
    Navigator.of(context)
        .pushNamed(MyApp.EVENTO_PADRAO_FORM, arguments: eventoPadrao)
        .then(refreshList);
  }

  goToDetails(BuildContext context, EventoPadrao eventoPadrao) {
    Navigator.of(context)
        .pushNamed(MyApp.EVENTO_PADRAO_DETAILS, arguments: eventoPadrao);
  }

  //excluir
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
