import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'items/customTooltip.dart';
import 'items/app_item_card_widget.dart';

// ignore: must_be_immutable
class DemandeItemWidget extends StatelessWidget {
   DemandeItemWidget({
    super.key,
    required this.adresse,
    required this.communaute,
    required this.date,
    required this.motif,
    required this.intention,
    required this.indexItemColor,
  });
  String date;
  String communaute;
  String adresse;
  String motif;
  String intention;
  int indexItemColor ;

  @override
  Widget build(BuildContext context) {
    return AppItemCardWidget(
      indexItemColor: indexItemColor,
      listWidgets: [
        Text("${date}",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),),
                  const SizedBox(
                    height: 1,
                  ),
                  CustomTooltip(
                    message: '${communaute}',
                    child: Text("${communaute}",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                  ),
                  CustomTooltip(
                    message: '${adresse}',
                    textColor: Colors.grey,
                    child: Text("${adresse}",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                    ),),
                  ),
              const SizedBox(height: 8,),
                  CustomTooltip(
                    message: '${intention}',
                    textColor: primaryColor,
                    child: Text("${intention}",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  CustomTooltip(
                    message: '${motif}',
                    child: Text("${motif}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                  ),
                  const SizedBox(height: 8,),
                  Row(children: [
                    Icon(Icons.share,color: greenColor,size: 16,),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("PARTAGER LA CARTE ",
                    style: TextStyle(color: greenColor,fontWeight: FontWeight.bold,fontSize: 12),)
                  ],)
      ],
      );
  }
}