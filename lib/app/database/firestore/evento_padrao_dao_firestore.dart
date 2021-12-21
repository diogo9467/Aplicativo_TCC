//@dart=2.9

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/interfaces/evento_padrao_dao.dart';

class EventoPadraoDAOFirestore implements EventoPadraoDAO {
  CollectionReference eventopadraoCollection;

  EventoPadraoDAOFirestore() {
    eventopadraoCollection =
        FirebaseFirestore.instance.collection('eventopadrao');
  }

  @override
  Future<List<EventoPadrao>> find() async {
    var result = await eventopadraoCollection.get();
    return result.docs
        .map((doc) => EventoPadrao(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            observacao: doc['observacao']))
        .toList();
  }

  @override
  remove(id) {
    eventopadraoCollection.doc(id).delete();
  }

  @override
  save(EventoPadrao eventopadrao) {
    eventopadraoCollection.doc(eventopadrao.id).set({
      'nome': eventopadrao.nome,
      'observacao': eventopadrao.observacao,
    });
  }
}