import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

import '../core/constants.dart';
import '../core/shared/modals.dart';
import 'items/hour_item.dart';

// ignore: must_be_immutable
class EgliseItemWidget extends StatelessWidget {
  EgliseItemWidget({
    super.key,
    required this.time,
    required this.data,
  });
  String time;
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 3),
      padding: EdgeInsets.only(bottom: padding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await Modals.showModalDetailEglise(
                      context,
                      // eglise: data['eglise'],
                      // adresse: data['adresse'],
                      // hours: data['date'], 
                      data: data,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${data['eglise']}',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SpaceGrotesk',
                            ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: greenColor.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${data['adresse']}",
                  style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
              ],
            ),
          ),
          SpGrid(
              spacing: padding * 2,
              runSpacing: padding * 2,
              crossAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                if (data['date'] != null)
                  ...data['date'].asMap().entries.map((entry) {
                    final index = entry.key;
                    return SpGridItem(
                        md: 2,
                        sm: 3,
                        xs: 4,
                        child: HourItem(
                          hour: "${data['date'][index]['hour']}",
                          press: () async {
                            await Modals.showModalDemandeMesse(
                              context,
                              hour: data['date'][index]['hour'],
                              time: time, 
                              data: data,
                            );
                          },
                        ));
                  }).toList()
              ])
        ],
      ),
    );
  }
}
