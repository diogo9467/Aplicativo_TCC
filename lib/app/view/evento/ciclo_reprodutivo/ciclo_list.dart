//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names

import 'package:tcc/app/domain/entities/ciclo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/bar/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list_back.dart';

class CicloList extends StatefulWidget with NavigationStates {
  @override
  State<CicloList> createState() => _CicloListState();
}

class _CicloListState extends State<CicloList> {
  String data = "";

  final _back = CicloListBack();

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.green, onPressed: onPressed);
  }

  Widget fieldData() {
    return TextFormField(
        onChanged: (value) => setState(() => data = value),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: 'Data do último cio: ',
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
            'Lista de ciclos reprodutivos',
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
                Navigator.of(context).pop();
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
                      List<Ciclo> lista = futuro.data;
                      lista.removeWhere(
                          (e) => e.uid != AuthService.getUser().uid);
                      var lista_filtrada = lista
                          .where((e) => e.ultimo_cio.contains(data))
                          .toList();
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

  Container makeEventWidget(Ciclo ciclo, BuildContext context) {
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
                      'https://simcides.com.br/wp-content/uploads/2020/06/cow2.png'))),
          title: Text(ciclo.identificacao),
          onTap: () {
            _back.goToDetails(context, ciclo);
          },
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                iconEditButton(() {
                  _back.goToForm(context, ciclo);
                }),
                iconRemoveButton(context, () {
                  _back.remove(ciclo.id);
                  Navigator.of(context).pop();
                })
              ],
            ),
          ),
        ));
  }
}
