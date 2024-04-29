import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/demande_item_widget.dart';
import 'package:une_messe/core/constants.dart';

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
      child: Column(
        children: [
          SizedBox(
            height: PADDING,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/Bienvenue👋🏾.png"),
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
          SizedBox(
            height: PADDING * 2,
          ),
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
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demandeList.length,
              itemBuilder: (context, i) {
                return DemandeItemWidget(
                  adresse: demandeList[i]['adresse'],
                  communaute: demandeList[i]['communaute'],
                  date: demandeList[i]['date'],
                  motif: demandeList[i]['motif'],
                  intention: demandeList[i]['intention'],
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
              padding: EdgeInsets.symmetric(horizontal:PADDING,vertical: PADDING*4),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RADIUS * 10),
                      topRight: Radius.circular(RADIUS * 10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Row(
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
                  SizedBox(
                    height: PADDING * 4,
                  ),
                  Text(
                    "Une seule messe",
                    style: TextStyle(color: yellowColor),
                  ),
                  const Text(
                    "peut tout changer.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: PADDING * 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PADDING * 3, vertical: PADDING),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.all(Radius.circular(RADIUS * 2))),
                    child: const Text(
                      "Partager",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: PADDING * 4,
                  ),
                  const Row(
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
