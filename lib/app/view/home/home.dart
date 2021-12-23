//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tcc/app/view/calendar/calendar.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';

class Home extends StatelessWidget {
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
            'Home',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: SingleChildScrollView(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/ti/vetor-gratis/p1/582034-ilustracao-em-icone-calendario-gr%C3%A1tis-vetor.jpg')),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Calendar()));
            },
            heroTag: null,
          ),
          FloatingActionButton(
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/677/677864.png')),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimalList()));
            },
            heroTag: null,
          ),
          FloatingActionButton(
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUw-t2Op2vTVwrq_2isyqgOotFgiyHLhGvXg&usqp=CAU')),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VacinaList()));
            },
            heroTag: null,
          ),
          FloatingActionButton(
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-vector/20190926/ourlarge/pngtree-schedule-glyph-icon-vector-png-image_1742916.jpg')),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventoPadraoList()));
            },
            heroTag: null,
          ),
          FloatingActionButton(
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://simcides.com.br/wp-content/uploads/2020/06/cow2.png')),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CicloList()));
            },
            heroTag: null,
          )
        ]));
  }
}
