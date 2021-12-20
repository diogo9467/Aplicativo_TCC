//@dart=2.9
// ignore_for_file: file_names, non_constant_identifier_names

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
