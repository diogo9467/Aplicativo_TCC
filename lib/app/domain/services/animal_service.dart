//@dart=2.9
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, duplicate_ignore

import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/domain/exception/domain_layer_exception.dart';
import 'package:tcc/app/domain/interfaces/animal_dao.dart';
import 'package:get_it/get_it.dart';

class AnimalService {
  var _dao = GetIt.I.get<AnimalDAO>();

  save(Animal animal) {
    validateIdentification(animal.identificacao);
    validateRaca(animal.raca);
    validateSexo(animal.sexo);
    validateData_aquisicao(animal.data_aquisicao);
    validateData_nascimento(animal.data_nascimento);
    validateInicio_lactacao(animal.inicio_lactacao);

    _dao.save(animal);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Animal>> find() {
    return _dao.find();
  }

  validateIdentification(String identificacao) {
    if (identificacao == "") {
      throw DomainLayerException('A identificacao é obrigatória.');
    }
  }

  validateRaca(String raca) {
    if (raca == "") {
      throw DomainLayerException('A raça é obrigatória.');
    }
  }

  validateSexo(String sexo) {
    if (sexo == "") {
      throw DomainLayerException('O sexo deve ser Macho ou Femea.');
    }
  }

  validateData_nascimento(String data_nascimento) {
    if (data_nascimento == "") {
      throw DomainLayerException('O data de nascimento é obrigatória.');
    }
  }

  validateData_aquisicao(String data_aquisicao) {
    if (data_aquisicao == "") {
      throw DomainLayerException('O data de aquisição é obrigatória');
    }
  }

  validateInicio_lactacao(String inicio_lactacao) {}
}
