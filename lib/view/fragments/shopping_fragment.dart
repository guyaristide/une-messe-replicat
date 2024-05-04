import 'package:flutter/material.dart';
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
        Positioned(
          top: 0,
          bottom: 200,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: PADDING*2),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                     height: 330,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shoppingItemList.length,
                    itemBuilder: (context, i) {
                      var item = shoppingItemList[i];
                      return Padding(
                        padding:  EdgeInsets.only(right:PADDING),
                        child: ShoppingCartWidget(
                                adresse: item['adresse'],
                                communaute: item['communaute'],
                                date: item['date'],
                                motif: item['motif'],
                                intention: item['intention'],
                                 name: item['name'], 
                                 indexItemColor: i, 
                                 nombreMesse:int.parse(item['nombre_messe']),
                              ),
                      );
                    },
                  ),
                ),
               const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
          Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
              color: Colors.white,
              width: size.width,
              height: 200,
                padding: EdgeInsets.symmetric(horizontal: PADDING * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical :10),
                    child: Row(
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
                  AppButtomWidget(
                    label: "Payer",
                     press: () async{
                            await Modals.showModalAddAdresse(context);
                            },
                  ),
                  AppButtomWidget(
                    label: "Ajouter une autre demande",
                    buttomColor: greenColor.withOpacity(0.2),
                    labelColor: greenColor,
                    press: () {},
                  ),
                  AppButtomWidget(
                    label: "Envoyer pour payer en espèces",
                    buttomColor: greenColor.withOpacity(0.2),
                    labelColor: greenColor,
                    press: () {},
                  )
                ],
              ),
            ),
    )
            
      ],
    );
  }
}
