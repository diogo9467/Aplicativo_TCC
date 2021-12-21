//@dart=2.9
// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

class Animal {
  int id;
  String identificacao;
  String sexo;
  String raca;
  String urlAvatar;
  String data_nascimento;
  String data_aquisicao;
  String inicio_lactacao;

  Animal(
      {this.id,
      this.identificacao,
      this.sexo,
      this.raca,
      this.data_nascimento,
      this.data_aquisicao,
      this.inicio_lactacao});
}

class EventoPadrao {
  int id;
  String nome;
  String observacao;

  EventoPadrao({
    this.id,
    this.nome,
    this.observacao,
  });
}

class Vacina {
  int id;
  String nome;
  String ult_aplicacao;
  String quant_doses;
  String intervalo_doses;

  Vacina({
    this.id,
    this.nome,
    this.ult_aplicacao,
    this.quant_doses,
    this.intervalo_doses,
  });
}
