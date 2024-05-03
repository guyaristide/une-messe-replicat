import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/app_buttom_widget.dart';
import '../../components/shopping_cart_widget.dart';
import '../../core/shared/modals.dart';

class ShoppingFragment extends StatefulWidget {
  const ShoppingFragment({super.key});

  @override
  State<ShoppingFragment> createState() => _ShoppingFragmentState();
}

class _ShoppingFragmentState extends State<ShoppingFragment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
     
    // SingleChildScrollView(
    //   child: SpGrid(
    //     width: size.width,
    //     spacing: PADDING,
    //     runSpacing: PADDING,
    //     alignment: WrapAlignment.start,
    //     crossAlignment: WrapCrossAlignment.center,
    //     children: [
    //       ...List.generate(
    //         shoppingItemList.length, (i) {
    //           var item = shoppingItemList[i];
    //         return  SpGridItem(
    //             xs: 12,
    //             md: 6,
    //             child: ShoppingCartWidget(
    //                   adresse: item['adresse'],
    //                   communaute: item['communaute'],
    //                   date: item['date'],
    //                   motif: item['motif'],
    //                   intention: item['intention'],
    //                    name: item['name'], 
    //                    indexItemColor: i,
    //                 ),
    //             );
    //         })
    //     ]
    //     ),
    // ),
    
    
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
              color: Colors.white,
              width: size.width,
              child: SpGrid(
                spacing: PADDING * 2,
                runSpacing: PADDING,
                crossAlignment:WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                padding: EdgeInsets.symmetric(vertical: PADDING * 2),
                children: [
                  SpGridItem(
                    padding: EdgeInsets.symmetric(vertical: PADDING),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style:
                              TextStyle(fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          "0 CFA",
                          style:
                              TextStyle(fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                  ),
                  SpGridItem(
                    md: 4,
                    child: AppButtomWidget(
                      label: "Payer",
                       press: () async{
                              await Modals.showModalAddAdresse(context);
                              },
                    ),
                  ),
                  SpGridItem(
                    md: 4,
                    child: AppButtomWidget(
                      label: "Ajouter une autre demande",
                      buttomColor: greenColor.withOpacity(0.2),
                      labelColor: greenColor,
                      press: () {},
                    ),
                  ),
                  SpGridItem(
                    md: 4,
                    child: AppButtomWidget(
                      label: "Envoyer pour payer en espèces",
                      buttomColor: greenColor.withOpacity(0.2),
                      labelColor: greenColor,
                      press: () {},
                    ),
                  )
                ],
              ),
            ),
    )
    
        
      ],
    );
  }
}
