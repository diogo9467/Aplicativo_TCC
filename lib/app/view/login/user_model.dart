class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
  });

  // recebendo os dados
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // enviando os dados
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
