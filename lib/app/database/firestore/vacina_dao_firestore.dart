//@dart=2.9

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/interfaces/vacina_dao.dart';

class VacinaDAOFirestore implements VacinaDAO {
  CollectionReference vacinaCollection;

  VacinaDAOFirestore() {
    vacinaCollection = FirebaseFirestore.instance.collection('vacina');
  }

  @override
  Future<List<Vacina>> find() async {
    var result = await vacinaCollection.get();
    return result.docs
        .map((doc) => Vacina(
              id: doc.reference.id.toString(),
              identificacao: doc['identificacao'],
              nome: doc['nome'],
              ult_aplicacao: doc['ult_aplicacao'],
              intervalo_doses: doc['intervalo_doses'],
              quant_doses: doc['quant_doses'],
            ))
        .toList();
  }

  @override
  remove(id) {
    vacinaCollection.doc(id).delete();
  }

  @override
  save(Vacina vacina) {
    vacinaCollection.doc(vacina.id).set({
      'identificacao': vacina.identificacao,
      'nome': vacina.nome,
      'ult_aplicacao': vacina.ult_aplicacao,
      'intervalo_doses': vacina.intervalo_doses,
      'quant_doses': vacina.quant_doses,
    });
  }
}
