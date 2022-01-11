//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/animals/animal_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc/app/view/bar/bloc.navigation_bloc/navigation_bloc.dart';

class AnimalList extends StatelessWidget with NavigationStates {
  final _back = AnimalListBack();

  CircleAvatar circleAvatar(String url) {
    return (CircleAvatar(
        radius: 20,
        backgroundColor: Colors.black,
        child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/677/677864.png'))));
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.green, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Lista de Animais',
            style: TextStyle(color: Colors.green),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {
                  _back.goToForm(context);
                }),
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Animal> lista = futuro.data;
                  lista.removeWhere((e) => e.uid != AuthService.getUser().uid);

                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var animal = lista[i];
                      return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1.3)),
                          child: ListTile(
                            leading: circleAvatar(animal.urlAvatar),
                            title: Text(animal.identificacao),
                            onTap: () {
                              _back.goToDetails(context, animal);
                            },
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  iconEditButton(() {
                                    _back.goToForm(context, animal);
                                  }),
                                  iconRemoveButton(context, () {
                                    _back.remove(animal.id);
                                    Navigator.of(context).pop();
                                  })
                                ],
                              ),
                            ),
                          ));
                    },
                  );
                }
              });
        }));
  }
}
