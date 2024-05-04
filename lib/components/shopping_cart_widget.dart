import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/constants.dart';
import 'items/app_item_card_widget.dart';
import 'items/customTooltip.dart';

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
    required this.nombreMesse,
    });
    String date;
  String communaute;
  String adresse;
  String motif;
  String intention;
  String name;
  int nombreMesse ;
  int indexItemColor ;

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
     return Container(
      width: 300,
      decoration: BoxDecoration(
        color: greenColor.withOpacity(0.08),
            borderRadius: BorderRadius.all(Radius.circular(RADIUS*3)),
      ),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           AppItemCardWidget(
            itemHeight: 150,
            indexItemColor: widget.indexItemColor,
            listWidgets: [
              Text("${widget.date}",
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
                          message: '${widget.communaute}',
                          child: Text("${widget.communaute}",
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),),
                        ),
                        CustomTooltip(
                          message: '${widget.adresse}',
                          textColor: Colors.grey,
                          child: Text("${widget.adresse}",
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12
                          ),),
                        ),
                    const SizedBox(height: 6,),
                        Text("Nombre de messes",
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
                          message: '${widget.nombreMesse} x Une Messe',
                          child: Text("${widget.nombreMesse} x Une Messe",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),),
                        ),
                   ] ),
             const SizedBox(
              height: 10,
             ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal:PADDING*2),
               child: CustomTooltip(
                      message: '${widget.intention}',
                      textColor: primaryColor,
                      child: Text("${widget.intention}",
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),),
                    ),
             ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60,
                    padding:  EdgeInsets.symmetric(horizontal:PADDING*2),
                    child: CustomTooltip(
                      message: '${widget.motif}',
                      child: Text("${widget.motif}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),),
                    ),
                  ),
                 const SizedBox(
              height: 5,
             ),
                  Padding(
               padding:  EdgeInsets.symmetric(horizontal:PADDING*2),
               child: Text("Par l’intercession de",
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
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:PADDING*2),
                    child: CustomTooltip(
                      message: '${widget.name}',
                      child: Text("${widget.name}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),),
                    ),
                  ),
                   const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:PADDING*2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.delete,color: Colors.red,size: 16,),
                            Text("SUPPRIMER",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                            )
                          ],
                        ),
                         Row(
                          children: [
                            Icon(Icons.edit,color: greenColor,size: 16,),
                            Text("MODIFIER",
                            style: TextStyle(
                              color: greenColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                            )
                          ],
                        ),
                      ],
                    ),
                    )
         ],
       ),
     );
  }
}