import 'package:flutter/material.dart';
import 'package:une_messe/components/shopping_cart_widget_desktop.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/demande_fragment.dart';
import '../../components/app_buttom_widget.dart';
//import '../../components/shopping_cart_widget.dart';
import '../../core/shared/modals.dart';

class ShoppingFragmentDesktop extends StatefulWidget {
  const ShoppingFragmentDesktop({super.key});

  @override
  State<ShoppingFragmentDesktop> createState() => _ShoppingFragmentDesktopState();
}

class _ShoppingFragmentDesktopState extends State<ShoppingFragmentDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding * 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Liste des articles de shopping 
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: padding * 2),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: shoppingItemList.length,
                        itemBuilder: (context, i) {
                          var item = shoppingItemList[i];
                          return Padding(
                            padding: EdgeInsets.only(bottom: padding * 4),
                            child: ShoppingCartWidgetDesktop(
                              indexItemColor: i,
                              data: item,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(width:  padding * 2), 
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "0 CFA",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                          MaterialPageRoute(builder: (context) => const DemandeFragment ()));
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
            ),
          ],
        ),
      ),
    );
  }
}
