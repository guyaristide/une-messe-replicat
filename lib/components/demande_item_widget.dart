import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/constants.dart';
import 'items/customTooltip.dart';

// ignore: must_be_immutable
class DemandeItemWidget extends StatelessWidget {
   DemandeItemWidget({
    super.key,
    required this.adresse,
    required this.communaute,
    required this.date,
    required this.motif,
    required this.intention,
    required this.backColor,
    required this.fontColor,
  });
  String date;
  String communaute;
  String adresse;
  String motif;
  String intention;
  dynamic backColor;
  dynamic fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:PADDING),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS*2)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 260,
            padding:  EdgeInsets.all(PADDING*2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${date}",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  height: 4,
                ),
                CustomTooltip(
                  message: '${communaute}',
                  child: Text("${communaute}",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                CustomTooltip(
                  message: '${adresse}',
                  textColor: Colors.grey,
                  child: Text("${adresse}",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey
                  ),),
                ),
            const SizedBox(height: 20,),
                CustomTooltip(
                  message: '${intention}',
                  textColor: primaryColor,
                  child: Text("${intention}",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTooltip(
                  message: '${motif}',
                  child: Text("${motif}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold
                  ),),
                ),
                const SizedBox(height: 20,),
                Row(children: [
                  Icon(Icons.share,color: greenColor,size: 20,),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("PARTAGER LA CARTE ",
                  style: TextStyle(color: greenColor,fontWeight: FontWeight.bold,fontSize: 12),)
                ],)
              ],
            ),
          ),

          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
              topRight: Radius.circular(RADIUS*2),
              bottomRight: Radius.circular(RADIUS*2)
                      ),
                      color: backColor,
                    ),
                width: 130,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 20,
                child: Container(
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
              topRight: Radius.circular(RADIUS*5),
              topLeft: Radius.circular(RADIUS*7),
              bottomRight: Radius.circular(RADIUS*2)
                      ),
                      color: fontColor,
                    ),
              ), 
                )
            ],
          )
        ],
      ),
    );
  }
}