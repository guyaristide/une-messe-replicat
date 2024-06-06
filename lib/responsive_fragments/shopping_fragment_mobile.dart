import 'package:flutter/material.dart';
import 'package:une_messe/components/items/dent_de_scie.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/index_mobile2.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xffe9eeea),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 200,
            right: 0,
            left: 0,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 330,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: shoppingItemList.length,
                      itemBuilder: (context, i) {
                        var item = shoppingItemList[i];
                        return Padding(
                          padding: EdgeInsets.only(right: padding * 2),
                          child: ShoppingCartWidget(
                            indexItemColor: i,
                            data: item,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none, // Permet au ClipPath de dépasser son conteneur
              children: [
                Positioned(
                  top: -10, // Décale le ClipPath vers le haut
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: ZigZagClipper(),
                    child: Container(
                      height: 30, // Ajustez la hauteur pour permettre aux dents d'être visibles
                      color: Colors.white, // Couleur des dents
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: size.width,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: padding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SpaceGrotesk',
                              ),
                            ),
                            Text(
                              "0 CFA",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SpaceGrotesk',
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButtonWidget(
                        label: "Payer",
                        press: () async {
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
                            MaterialPageRoute(builder: (context) => const Index2()),
                          );
                        },
                      ),
                      AppButtonWidget(
                        label: "Envoyer pour payer en espèces",
                        buttomColor: greenColor[100],
                        labelColor: greenColor,
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
