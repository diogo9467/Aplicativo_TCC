// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, import_of_legacy_library_into_null_safe, prefer_const_constructors_in_immutables
library bottom_navy_bar;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/view/calendar/calendar.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';

class HomePage extends StatelessWidget {
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: OutlinedButton(
              onPressed: () => context.read<AuthService>().logout(),
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("Minha conta")),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), title: Text("Meus pedidos")),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            title: Text("Favoritos")),
      ],
    ),
  );
}

class BottomNavyBar extends StatelessWidget {
  BottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  /// The selected item is index. Changing this property will change and animate
  /// the item being selected. Defaults to zero.
  final int selectedIndex;

  /// The icon size of all items. Defaults to 24.
  final double iconSize;

  /// The background color of the navigation bar. It defaults to
  /// [Theme.bottomAppBarColor] if not provided.
  final Color? backgroundColor;

  /// Whether this navigation bar should show a elevation. Defaults to true.
  final bool showElevation;

  /// Use this to change the item's animation duration. Defaults to 270ms.
  final Duration animationDuration;

  /// Defines the appearance of the buttons that are displayed in the bottom
  /// navigation bar. This should have at least two items and five at most.
  final List<BottomNavyBarItem> items;

  /// A callback that will be called when a item is pressed.
  final ValueChanged<int> onItemSelected;

  /// Defines the alignment of the items.
  /// Defaults to [MainAxisAlignment.spaceBetween].
  final MainAxisAlignment mainAxisAlignment;

  /// The [items] corner radius, if not set, it defaults to 50.
  final double itemCornerRadius;

  /// Defines the bottom navigation bar height. Defaults to 56.
  final double containerHeight;

  /// Used to configure the animation curve. Defaults to [Curves.linear].
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 130 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 130 : 50,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: item.icon,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The [BottomNavyBar.items] definition.
class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  /// Defines this item's icon which is placed in the right side of the [title].
  final Widget icon;

  /// Defines this item's title which placed in the left side of the [icon].
  final Widget title;

  /// The [icon] and [title] color defined when this item is selected. Defaults
  /// to [Colors.blue].
  final Color activeColor;

  /// The [icon] and [title] color defined when this item is not selected.
  final Color? inactiveColor;

  /// The alignment for the [title].
  ///
  /// This will take effect only if [title] it a [Text] widget.
  final TextAlign? textAlign;
}
