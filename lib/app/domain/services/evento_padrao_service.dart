//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:tcc/app/domain/interfaces/evento_padrao_dao.dart';
import 'package:get_it/get_it.dart';

class EventoPadraoService {
  var _dao = GetIt.I.get<EventoPadraoDAO>();

  save(EventoPadrao eventopadrao) {
    validateNome(eventopadrao.nome);
    validateObservacao(eventopadrao.observacao);
    validateData(eventopadrao.data);

    _dao.save(eventopadrao);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<EventoPadrao>> find() {
    return _dao.find();
  }

  validateNome(String nome) {
    if (nome == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validateData(String data) {
    if (data == "") {
      throw DomainLayerException('A data é obrigatória.');
    }
  }

  validateObservacao(String observacao) {}
}
