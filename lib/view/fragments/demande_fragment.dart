import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/eglise_item_widget.dart';
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
          CalendarWidget(),

          ...List.generate(egliseList.length, (index) {
           var item = egliseList[index];
            return EgliseItemWidget(
              time: 'Dimanche 7 Avril', 
              data: item,
            );
          })
        ],
      ),
    );
  }


 
}
