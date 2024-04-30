import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/app_buttom_widget.dart';
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
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: PADDING,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: PADDING * 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/Panier-de-prières🙌🏾.png"),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              padding: EdgeInsets.all(PADDING * 1.5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(RADIUS))),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Text(
                                "0",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: PADDING * 10,
              ),
              Text(
                'Contenu du panier',
                style: TextStyle(fontSize: 24.0),
              ),
              
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
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
          )
          )
      ],
    );
  }
}
