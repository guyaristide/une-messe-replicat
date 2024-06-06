import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/demande_item_widget.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/view/fragments/demande_fragment.dart';

import '../../core/shared/modals.dart';

class HomeFragmentTablet extends StatefulWidget {
  const HomeFragmentTablet({super.key});


  @override
  State<HomeFragmentTablet> createState() => _HomeFragmentTabletState();

}

class _HomeFragmentTabletState extends State<HomeFragmentTablet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: padding*2),
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.all(padding * 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(radius * 2))),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Image.png",
                  fit: BoxFit.cover,
                  width: size.width,
                ),
                SizedBox(
                  height: padding * 2,
                ),
                AppButtonWidget(press: () {
                            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DemandeFragment ()),
    );
                            }, label: "Demander une messe")


              ],
            ),
          ),
          SizedBox(
            height: padding * 2,
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
                width: padding,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: greenColor,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: padding * 2,
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demandeList.length,
              itemBuilder: (context, i) {
                var item = demandeList[i];
                return Padding(
                  padding:  EdgeInsets.only(right:padding),
                  child: DemandeItemWidget(
                    indexItemColor: i, 
                    data: item,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: padding * 2,
          ),
          Container(
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding*2),
            decoration: BoxDecoration(
                color: tertiairColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius * 2),
                  topRight: Radius.circular(radius * 2),
                  bottomLeft: Radius.circular(radius * 2),
                  bottomRight: Radius.circular(radius * 2),
                )
              ),
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: padding,vertical: padding*4),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius * 5),
                  topRight: Radius.circular(radius * 5),
                  bottomLeft: Radius.circular(radius * 5),
                  bottomRight: Radius.circular(radius * 5),
                )
              ),
            
              child: SpGrid(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                runSpacing: padding*4,
                spacing: padding*4,
                padding: EdgeInsets.symmetric(vertical: padding*4),
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
                          horizontal: padding * 3, vertical: padding),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(radius * 2))),
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
          ),
          SizedBox( height: padding ),
        ],
      ),
    );
  }
}


