//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names, must_be_immutable

import 'package:tcc/app/domain/entities/evento_padrao.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/bar/bloc.navigation_bloc/navigation_bloc.dart';

import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list_back.dart';

class EventoPadraoList extends StatefulWidget with NavigationStates {
  @override
  State<EventoPadraoList> createState() => _EventoPadraoListState();
}

class _EventoPadraoListState extends State<EventoPadraoList> {
  String data = "";

  final _back = EventoPadraoListBack();

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.green, onPressed: onPressed);
  }

  Widget fieldData() {
    return TextFormField(
        onChanged: (value) => setState(() => data = value),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Filtro de data: ',
        ));
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
                _back.goToForm(context);
              },
            ),
          ],
        ),
        body: Observer(builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: fieldData()),
              FutureBuilder(
                  future: _back.list,
                  builder: (context, futuro) {
                    if (!futuro.hasData) {
                      return SliverToBoxAdapter(
                          child: CircularProgressIndicator());
                    } else {
                      List<EventoPadrao> lista = futuro.data;
                      lista.removeWhere(
                          (e) => e.uid != AuthService.getUser().uid);
                      var lista_filtrada =
                          lista.where((e) => e.data.contains(data)).toList();
                      return SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var evento_padrao = lista_filtrada[index];
                          return makeEventWidget(evento_padrao, context);
                        },
                        childCount: lista_filtrada.length,
                      ));
                    }
                  })
            ],
          );
        }));
  }

  Container makeEventWidget(EventoPadrao evento_padrao, BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.3)),
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
  }
}
