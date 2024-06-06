import 'package:flutter/material.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/demande_item_widget.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/demande_fragment.dart';
import '../../core/shared/modals.dart';

class HomeFragmentDesktop extends StatefulWidget {
  const HomeFragmentDesktop({super.key});

  @override
  State<HomeFragmentDesktop> createState() => _HomeFragmentDesktopState();
}

class _HomeFragmentDesktopState extends State<HomeFragmentDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: padding * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Partie gauche
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
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
                        width: double.infinity,
                      ),
                      SizedBox(height: padding * 2),
                     AppButtonWidget(press: () {
                            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DemandeFragment ()),
    );
                            }, label: "Demander une messe")
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
                      ),
                    ),
                    SizedBox(width: padding),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: greenColor,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: padding * 2),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: demandeList.length,
                    itemBuilder: (context, i) {
                      var item = demandeList[i];
                      return Padding(
                        padding: EdgeInsets.only(right: padding),
                        child: DemandeItemWidget(
                          indexItemColor: i,
                          data: item,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: padding * 2),
          // Partie droite
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal: padding * 2).copyWith(top: padding * 2),
                  decoration: BoxDecoration(
                    color: tertiairColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius * 2),
                      topRight: Radius.circular(radius * 2),
                      bottomLeft: Radius.circular(radius * 2),
                      bottomRight: Radius.circular(radius * 2),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: padding),
                      Container(
                        width: size.width,
                        height: size.height / 1.1,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius * 3),
                            topRight: Radius.circular(radius * 3),
                            bottomLeft: Radius.circular(radius * 3),
                            bottomRight: Radius.circular(radius * 3),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: padding*4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/logo.png"),
                                const SizedBox(width: 6),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Une", style: TextStyle(color: Colors.white)),
                                    Text("Messe", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: padding * 2),
                            Text("Une seule messe", style: TextStyle(color: yellowColor)),
                            const Text("peut tout changer.", style: TextStyle(color: Colors.white)),
                            SizedBox(height: padding * 2),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: padding * 3, vertical: padding),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
                              ),
                              child: const Text(
                                "Partager",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: padding * 6),
                            GestureDetector(
                              onTap: () async {
                                await Modals.showModalQrcode(context);
                              },
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.qr_code_2, 
                                    color: Colors.white,
                                    size: size.height/3,
                                  ),
                                  const SizedBox(width: 5),
                                  //Text("QR Code", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: padding)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
