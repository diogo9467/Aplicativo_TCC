//@dart=2.9

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/app/domain/entities/users.dart';
import 'package:tcc/app/domain/interfaces/users_dao.dart';

class UsersDAOFirestore implements UsersDAO {
  CollectionReference usersCollection;

  UsersDAOFirestore() {
    usersCollection = FirebaseFirestore.instance.collection('users');
  }

  @override
  Future<List<Users>> find() async {
    var result = await usersCollection.get();
    return result.docs
        .map((doc) => Users(
              id: doc.reference.id.toString(),
              firstName: doc['firstName'],
              secondName: doc['secondName'],
              email: doc['email'],
              uid: doc['uid'],
            ))
        .toList();
  }

  @override
  remove(id) {
    usersCollection.doc(id).delete();
  }

  @override
  save(Users users) {
    usersCollection.doc(users.id).set({
      'firstName': users.firstName,
      'secondname': users.secondName,
      'email': users.email,
      'uid': users.uid,
    });
  }
}
