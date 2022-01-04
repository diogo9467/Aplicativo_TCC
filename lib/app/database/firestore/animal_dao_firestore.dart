//@dart=2.9
import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/domain/interfaces/animal_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalDAOFirestore implements AnimalDAO {
  CollectionReference animalCollection;

  AnimalDAOFirestore() {
    animalCollection = FirebaseFirestore.instance.collection('animal');
  }

  @override
  Future<List<Animal>> find() async {
    var result = await animalCollection.get();
    return result.docs
        .map((doc) => Animal(
            id: doc.reference.id.toString(),
            identificacao: doc['identificacao'],
            raca: doc['raca'],
            sexo: doc['sexo'],
            data_nascimento: doc['data_nascimento'],
            data_aquisicao: doc['data_aquisicao'],
            inicio_lactacao: doc['inicio_lactacao'],
            uid: doc['uid']))
        .toList();
  }

  @override
  remove(id) {
    animalCollection.doc(id).delete();
  }

  @override
  save(Animal animal) {
    animalCollection.doc(animal.id).set({
      'identificacao': animal.identificacao,
      'raca': animal.raca,
      'sexo': animal.sexo,
      'data_nascimento': animal.data_nascimento,
      'data_aquisicao': animal.data_aquisicao,
      'inicio_lactacao': animal.inicio_lactacao,
      'uid': animal.uid,
    });
  }
}
