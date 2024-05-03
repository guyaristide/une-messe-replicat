import 'package:flutter/material.dart';

import 'items/app_item_card_widget.dart';

// ignore: must_be_immutable
class ShoppingCartWidget extends StatefulWidget {
   ShoppingCartWidget({
     super.key,
    required this.adresse,
    required this.communaute,
    required this.date,
    required this.motif,
    required this.intention,
    required this.name,
    required this.indexItemColor,
    });
    String date;
  String communaute;
  String adresse;
  String motif;
  String intention;
  String name;
  int indexItemColor ;


  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
     return AppItemCardWidget(
      indexItemColor: widget.indexItemColor,
      listWidgets: [], 
      );
  }
}