//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:tcc/app/domain/interfaces/ciclo_dao.dart';
import 'package:get_it/get_it.dart';

class CicloService {
  var _dao = GetIt.I.get<CicloDAO>();

  save(Ciclo ciclo) {
    validateUltimo_cio(ciclo.ultimo_cio);
    validateUltima_cria(ciclo.ultima_cria);
    validateIdentificacao(ciclo.identificacao);
    validateDia_cio(ciclo.dia_cio);
    validateDia_cria(ciclo.dia_cria);
    _dao.save(ciclo);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Ciclo>> find() {
    return _dao.find();
  }

  validateUltimo_cio(String ultimo_ciclo) {}

  validateUltima_cria(String ultima_cria) {}

  validateIdentificacao(String identificacao) {
    if (identificacao == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validateDia_cio(String dia_cio) {}
  validateDia_cria(String dia_cria) {}
}
