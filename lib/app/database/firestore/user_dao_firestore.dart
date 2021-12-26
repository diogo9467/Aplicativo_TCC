//@dart=2.9

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/app/domain/entities/user.dart';

import 'package:tcc/app/domain/interfaces/user_dao.dart';

class UserDAOFirestore implements UserDAO {
  CollectionReference userCollection;

  UserDAOFirestore() {
    userCollection = FirebaseFirestore.instance.collection('user');
  }

  @override
  Future<List<User>> find() async {
    var result = await userCollection.get();
    return result.docs
        .map((doc) => User(
              id: doc.reference.id.toString(),
              nome: doc['nome'],
            ))
        .toList();
  }

  @override
  remove(id) {
    userCollection.doc(id).delete();
  }

  @override
  save(User user) {
    userCollection.doc(user.id).set({
      'nome': user.nome,
    });
  }
}
