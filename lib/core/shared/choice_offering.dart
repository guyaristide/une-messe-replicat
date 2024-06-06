import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/items/dent_de_scie.dart';
//import 'package:une_messe/components/items/dent_de_scie.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/index_mobile2.dart';
import '../../components/offering_item_wiget.dart';

class ChoiceOffering extends StatefulWidget {
  const ChoiceOffering({
    super.key,
  });

  @override
  State<ChoiceOffering> createState() => _ChoiceOfferingState();
}

class _ChoiceOfferingState extends State<ChoiceOffering> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xffe9eeea), // Correction de la couleur de fond
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            constraints: BoxConstraints(
              minHeight: size.height / 1.4,
              maxHeight: size.height / 1.2,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(radius * 3)),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(radius * 3)),
                          color: greenColor[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Image.asset("assets/images/hands-gesture.png")),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Choisissez votre offrande",
                              style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SpaceGrotesk',
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: padding * 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: ShapeDecoration(
                                color: Colors.black45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                    color: greenColor[50],
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: offeringItems.length,
                      itemBuilder: (context, e) {
                        var item = offeringItems[e];
                        return OfferingItemWidget(
                          data: item,
                        );
                      },
                    ),
                  )),
                  Stack(
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
                        padding: EdgeInsets.symmetric(horizontal: padding * 2),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Offrande",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 14,
                                      fontFamily: 'SpaceGrotesk',
                                      ),
                                ),
                                Text(
                                  "0 CFA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 14,
                                      fontFamily: 'SpaceGrotesk',
                                      ),
                                ),
                              ],
                            ),
                            AppButtonWidget(
                              label: "Ajouter au panier",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Index2()));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
