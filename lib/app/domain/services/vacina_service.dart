//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:tcc/app/domain/interfaces/vacina_dao.dart';
import 'package:get_it/get_it.dart';

class VacinaService {
  var _dao = GetIt.I.get<VacinaDAO>();

  save(Vacina vacina) {
    validateNome(vacina.nome);
    validateUlt_aplicacao(vacina.ult_aplicacao);
    validateQuant_doses(vacina.quant_doses);
    validateIntervalo_doses(vacina.intervalo_doses);
    validateIdentificacao(vacina.identificacao);

    _dao.save(vacina);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Vacina>> find() {
    return _dao.find();
  }

  validateNome(String nome) {
    if (nome == "") {
      throw DomainLayerException('O nome da vacina é obrigatória.');
    }
  }

  validateUlt_aplicacao(String ult_aplicacao) {}

  validateQuant_doses(String quant_doses) {
    if (quant_doses == "") {
      throw DomainLayerException('A quantidade de doeses é obrigatória.');
    }
  }

  validateIntervalo_doses(String intervalo_doses) {}

  validateIdentificacao(String identificacao) {
    if (identificacao == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }
}
