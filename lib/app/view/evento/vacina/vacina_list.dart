//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/view/evento/event_form.dart';
import 'package:tcc/app/view/evento/vacina/vacina_form.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VacinaList extends StatelessWidget {
  final _back = VacinaListBack();

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
            'Lista de vacinas',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VacinaForm()));
              },
            ),
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Vacina> lista = futuro.data;

                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var vacina = lista[i];
                      return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1.3)),
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUw-t2Op2vTVwrq_2isyqgOotFgiyHLhGvXg&usqp=CAU'))),
                            title: Text(vacina.nome),
                            onTap: () {
                              _back.goToDetails(context, vacina);
                            },
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  iconEditButton(() {
                                    _back.goToForm(context, vacina);
                                  }),
                                  iconRemoveButton(context, () {
                                    _back.remove(vacina.id);
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
