import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/demande_item_widget.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/index_mobile1.dart';
//import 'package:une_messe/view/fragments/index_mobile2.dart';
import '../../core/shared/modals.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffe9eeea),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding * 2),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(padding * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Image.png",
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                  SizedBox(height: padding * 2),
                  AppButtonWidget(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Index()),
                      );
                    },
                    label: "Demander une messe",
                  ),
                ],
              ),
            ),
            SizedBox(height: padding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dernières Demandes',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
                SizedBox(width: padding),
                Icon(
                  Icons.arrow_forward_ios,
                  color: greenColor,
                  size: 20,
                )
              ],
            ),
            SizedBox(height: padding * 2),
        SizedBox(
  height: 170,
  child: OverflowBox(
    maxWidth: size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: demandeList.length,
      itemBuilder: (context, i) {
        var item = demandeList[i];
        return Padding(
                    padding: EdgeInsets.only(right: padding),
                    child: Card(
                      elevation: 3, // Élévation de la carte
                      shadowColor: Colors.black54, // Couleur de l'ombre de la carte
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius * 2), // Bordure arrondie de la carte
                        side: const BorderSide(
                          color: Colors.black12, // Couleur de la bordure de la carte
                          width: 1.3, // Largeur de la bordure de la carte
                        ),
                      ),
                      child: DemandeItemWidget(
                        indexItemColor: i,
                        data: item,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),


            SizedBox(height: padding * 2),
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding * 4)
                  .copyWith(top: padding * 4),
              decoration: BoxDecoration(
                color: tertiairColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius * 2),
                  topRight: Radius.circular(radius * 2),
                  bottomLeft: Radius.circular(radius * 2),
                  bottomRight: Radius.circular(radius * 2),
                ),
              ),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius * 15),
                    topRight: Radius.circular(radius * 15),
                  ),
                ),
                child: SpGrid(
                  crossAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  runSpacing: padding * 4,
                  spacing: padding * 4,
                  padding: EdgeInsets.symmetric(vertical: padding * 4),
                  children: [
                    SpGridItem(
                      xs: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo.png"),
                          const SizedBox(width: 6),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Une",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SpaceGrotesk',
                                  ),
                              ),
                              Text(
                                "Messe",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'SpaceGrotesk',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SpGridItem(
                      md: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Une seule messe",
                            style: TextStyle(
                              color: yellowColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SpaceGrotesk',
                            ),
                          ),
                          const Text(
                            "peut tout changer.",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SpaceGrotesk',
                              ),
                          ),
                        ],
                      ),
                    ),
                    SpGridItem(
                      md: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding * 3, vertical: padding),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                              Radius.circular(radius * 2)),
                        ),
                        child: const Text(
                          "Partager",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SpaceGrotesk',
                            ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SpGridItem(
                      md: 4,
                      child: GestureDetector(
                        onTap: () async {
                          await Modals.showModalQrcode(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "QR Code",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SpaceGrotesk',
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
