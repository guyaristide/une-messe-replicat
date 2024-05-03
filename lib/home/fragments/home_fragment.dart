import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/demande_item_widget.dart';
import 'package:une_messe/core/constants.dart';

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

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: PADDING*2),
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.all(PADDING * 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(RADIUS * 2))),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Image.png",
                  fit: BoxFit.cover,
                  width: size.width,
                ),
                SizedBox(
                  height: PADDING * 2,
                ),
                AppButtomWidget(press: () {}, label: "Demander une messe")
              ],
            ),
          ),
          SizedBox(
            height: PADDING * 2,
          ),
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
              SizedBox(
                width: PADDING,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: greenColor,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: PADDING * 2,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demandeList.length,
              itemBuilder: (context, i) {
                var item = demandeList[i];
                return Padding(
                  padding:  EdgeInsets.only(right:PADDING),
                  child: DemandeItemWidget(
                    adresse: item['adresse'],
                    communaute: item['communaute'],
                    date: item['date'],
                    motif: item['motif'],
                    intention: item['intention'], 
                    indexItemColor: i,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: PADDING * 2,
          ),
          Container(
            // height: 200,
            padding: EdgeInsets.symmetric(horizontal: PADDING * 4)
                .copyWith(top: PADDING * 4),
            decoration: BoxDecoration(
                color: tertiairColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RADIUS * 2),
                    topRight: Radius.circular(RADIUS * 2))),
            child: Container(
              width: size.width,
              // padding: EdgeInsets.symmetric(horizontal:PADDING,vertical: PADDING*4),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RADIUS * 10),
                      topRight: Radius.circular(RADIUS * 10))),
              child: SpGrid(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                runSpacing: PADDING*4,
                spacing: PADDING*4,
                padding: EdgeInsets.symmetric(vertical: PADDING*4),
                children: [
                  
                  SpGridItem(
                xs: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/logo.png"),
                        const SizedBox(
                          width: 6,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Une",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Messe",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        )
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
                          style: TextStyle(color: yellowColor),
                        ),
                        const Text(
                          "peut tout changer.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  
                  SpGridItem(
                    md: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: PADDING * 3, vertical: PADDING),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(RADIUS * 2))),
                      child: const Text(
                        "Partager",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  
                    SpGridItem(
                    md: 4,
                     child: GestureDetector(
                      onTap: () async{
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
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "QR Code",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                                         ),
                     ),
                   )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


