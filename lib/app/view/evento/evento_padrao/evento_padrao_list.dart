//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names

import 'package:tcc/app/domain/entities/evento_padrao.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list_back.dart';

class EventoPadraoList extends StatelessWidget {
  final _back = EventoPadraoListBack();

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
            'Lista de eventos padrões',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventoPadraoForm()));
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
                  List<EventoPadrao> lista = futuro.data;

                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var evento_padrao = lista[i];
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
                                        'https://png.pngtree.com/png-vector/20190926/ourlarge/pngtree-schedule-glyph-icon-vector-png-image_1742916.jpg'))),
                            title: Text(evento_padrao.nome),
                            onTap: () {
                              _back.goToDetails(context, evento_padrao);
                            },
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  iconEditButton(() {
                                    _back.goToForm(context, evento_padrao);
                                  }),
                                  iconRemoveButton(context, () {
                                    _back.remove(evento_padrao.id);
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
