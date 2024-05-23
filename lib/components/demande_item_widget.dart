import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'items/customTooltip.dart';
import 'items/app_item_card_widget.dart';

// ignore: must_be_immutable
class DemandeItemWidget extends StatelessWidget {
   DemandeItemWidget({
    super.key,
    required this.indexItemColor,
    required this.data
  });
  int indexItemColor ;
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return AppItemCardWidget(
      indexItemColor: indexItemColor,
      listWidgets: [
        Text("${data['date']}",
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
                    message: '${data['communaute']}',
                    child: Text("${data['communaute']}",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                  ),
                  CustomTooltip(
                    message: '${data['adresse']}',
                    textColor: Colors.grey,
                    child: Text("${data['adresse']}",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                    ),),
                  ),
              const SizedBox(height: 8,),
                  CustomTooltip(
                    message: '${data['intention']}',
                    textColor: primaryColor,
                    child: Text("${data['intention']}",
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
                    message: '${data['motif']}',
                    child: Text("${data['motif']}",
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