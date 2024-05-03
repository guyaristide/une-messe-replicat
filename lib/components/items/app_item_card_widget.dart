import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants.dart';

// ignore: must_be_immutable
class AppItemCardWidget extends StatelessWidget {
   AppItemCardWidget({
    super.key,
    required this.listWidgets,
     this.itemHeight = 170,
     this.itemWidth = 300,
    required this.indexItemColor,
  });
  List<Widget> listWidgets;
  double itemHeight;
  double itemWidth;
  int indexItemColor ;
  

  @override
  Widget build(BuildContext context) {
  final itemColor = colorItems[indexItemColor % colorItems.length];

    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS*2)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              // width: itemWidth,
              padding:  EdgeInsets.all(PADDING*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: listWidgets,
             ),
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                Container(
                  // width: 90,
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                topRight: Radius.circular(RADIUS*2),
                bottomRight: Radius.circular(RADIUS*2)
                        ),
                        color: itemColor['backColor'],
                      ),
                  // width: 90,
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
                        color: itemColor['fontColor'],
                      ),
                ), 
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}