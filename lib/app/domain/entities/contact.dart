//@dart=2.9
// ignore_for_file: non_constant_identifier_names

class Contact {
  dynamic id;
  String identificacao;
  String sexo;
  String raca;
  String urlAvatar;
  String data_nascimento;
  String data_aquisicao;
  String inicio_lactacao;

  Contact(
      {this.id,
      this.identificacao,
      this.sexo,
      this.raca,
      this.urlAvatar,
      this.data_nascimento,
      this.data_aquisicao,
      this.inicio_lactacao});
}
