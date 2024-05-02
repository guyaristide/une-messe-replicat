import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/infos_eglise_item_widget.dart';
import '../../components/items/calendarWidget.dart';

class DemandeFragment extends StatefulWidget {
  const DemandeFragment({super.key});

  @override
  State<DemandeFragment> createState() => _DemandeFragmentState();
}

class _DemandeFragmentState extends State<DemandeFragment> {

  
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: PADDING,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PADDING * 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/Choisissez.votre.messe🙏🏾.png"),
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
            height: PADDING * 2,
          ),
          CalendarWidget(),

          ...List.generate(egliseList.length, (index) {
            return InfosEgliseItemWidget(
              eglise: egliseList[index]['eglise'],
              adresse: egliseList[index]['adresse'],
              hours: egliseList[index]['date'],
              date: 'Dimanche 7 Avril',
            );
          })
        ],
      ),
    );
  }


 
}
