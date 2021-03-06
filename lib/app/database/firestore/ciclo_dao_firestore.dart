//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/domain/interfaces/ciclo_dao.dart';

class CicloDAOFirestore implements CicloDAO {
  CollectionReference cicloCollection;

  CicloDAOFirestore() {
    cicloCollection =
        FirebaseFirestore.instance.collection('ciclo reprodutivo');
  }

  @override
  Future<List<Ciclo>> find() async {
    var result = await cicloCollection.get();
    return result.docs
        .map((doc) => Ciclo(
            id: doc.reference.id.toString(),
            ultimo_cio: doc['ultimo_cio'],
            dia_cio: doc['dia_cio'],
            ultima_cria: doc['ultima_cria'],
            dia_cria: doc['dia_cria'],
            identificacao: doc['identificacao'],
            uid: doc['uid']))
        .toList();
  }

  @override
  remove(id) {
    cicloCollection.doc(id).delete();
  }

  @override
  save(Ciclo ciclo) {
    cicloCollection.doc(ciclo.id).set({
      'identificacao': ciclo.identificacao,
      'ultimo_cio': ciclo.ultimo_cio,
      'ultima_cria': ciclo.ultima_cria,
      'dia_cria': ciclo.dia_cria,
      'dia_cio': ciclo.dia_cio,
      'uid': ciclo.uid,
    });
  }
}
