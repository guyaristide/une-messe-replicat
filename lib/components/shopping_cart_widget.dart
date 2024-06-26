import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'items/app_item_card_widget.dart';
import 'items/customTooltip.dart';

// ignore: must_be_immutable
class ShoppingCartWidget extends StatefulWidget {
  ShoppingCartWidget({
    super.key,
    required this.indexItemColor,
    required this.data,
    });
  int indexItemColor ;
  dynamic data;

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
            borderRadius: BorderRadius.all(Radius.circular(radius*3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppItemCardWidget(
            itemHeight: 150,
            indexItemColor: widget.indexItemColor,
            listWidgets: [
              Text("${widget.data['date']}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                          fontSize: 12
                        ),),
                        const SizedBox(
                          height: 1,
                        ),
                        CustomTooltip(
                          message: '${widget.data['communaute']}',
                          child: Text("${widget.data['communaute']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SpaceGrotesk',
                            fontSize: 12
                          ),),
                        ),
                        CustomTooltip(
                          message: '${widget.data['adresse']}',
                          textColor: const Color(0xff444B59),
                          child: Text("${widget.data['adresse']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                            color: Color(0xff444B59),
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
                          fontFamily: 'SpaceGrotesk',
                          fontSize: 12
                        ),),
                        const SizedBox(
                          height: 1,
                        ),
                        CustomTooltip(
                          message: '${int.parse(widget.data['nombre_messe']?? "0")} x Une Messe',
                          child: Text("${int.parse(widget.data['nombre_messe']?? "0")} x Une Messe",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SpaceGrotesk',
                            fontSize: 12
                          ),),
                        ),
                  ] ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:padding*2),
              child: CustomTooltip(
                      message: '${widget.data['intention']}',
                      textColor: primaryColor,
                      child: Text("${widget.data['intention']}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
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
                    padding:  EdgeInsets.symmetric(horizontal:padding*2),
                    child: CustomTooltip(
                      message: '${widget.data['motif']}',
                      child: Text("${widget.data['motif']}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 12
                      ),),
                    ),
                  ),
                const SizedBox(
              height: 5,
            ),
                  Padding(
              padding:  EdgeInsets.symmetric(horizontal:padding*2),
              child: Text("Par l’intercession de",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              style: TextStyle(
              color: primaryColor,
                fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
                fontSize: 12
              ),),
            ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:padding*2),
                    child: CustomTooltip(
                      message: '${widget.data['name']}',
                      child: Text("${widget.data['name']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 12
                      ),),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:padding*2),
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
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SpaceGrotesk',
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
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SpaceGrotesk',
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