import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:une_messe/components/items/calendarWidget.dart';
import 'package:une_messe/core/constants.dart';
import '../../components/eglise_item_widget.dart';

class DemandeFragment extends StatefulWidget {
  const DemandeFragment({super.key});

  @override
  State<DemandeFragment> createState() => _DemandeFragmentState();
}

class _DemandeFragmentState extends State<DemandeFragment> {
  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.1),
          child: Column(
            children: [
              const LocalizedCalendarWidget(),
              ...List.generate(egliseList.length, (index) {
                var item = egliseList[index];
                return EgliseItemWidget(
                  time: 'Dimanche 7 Avril',
                  data: item,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}


