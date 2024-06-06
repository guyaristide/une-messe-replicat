import 'package:flutter/material.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/demande_fragment.dart';

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
            padding: EdgeInsets.symmetric(horizontal: padding*2),
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
                        padding:  EdgeInsets.only(right:padding),
                        child: ShoppingCartWidget(
                                indexItemColor: i, 
                                data: item,
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
                padding: EdgeInsets.symmetric(horizontal: padding * 2),
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
                  AppButtonWidget(
                    label: "Payer",
                    press: () async{
                            await Modals.showModalAddAdresse(context);
                            },
                  ),
                  AppButtonWidget(
                    label: "Ajouter une autre demande",
                    buttomColor: greenColor[100],
                    labelColor: greenColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DemandeFragment ()));
                    },
                  ),
                  AppButtonWidget(
                    label: "Envoyer pour payer en espèces",
                    buttomColor: greenColor[100],
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
