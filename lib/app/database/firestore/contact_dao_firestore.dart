//@dart=2.9
import 'package:tcc/app/domain/entities/contact.dart';
import 'package:tcc/app/domain/interfaces/contact_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactDAOFirestore implements ContactDAO {
  CollectionReference contactCollection;

  ContactDAOFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs
        .map((doc) => Contact(
            id: doc.reference.id.toString(),
            identificacao: doc['identificacao'],
            email: doc['email'],
            telefone: doc['telefone'],
            urlAvatar: doc['urlAvatar']))
        .toList();
  }

  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set({
      'identificacao': contact.identificacao,
      'email': contact.email,
      'telefone': contact.telefone,
      'urlAvatar': contact.urlAvatar
    });
  }
}
