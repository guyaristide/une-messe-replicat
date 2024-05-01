import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:une_messe/core/constants.dart';

List<Widget> buildWeekDays() {
  initializeDateFormatting('fr_FR', null);

  final now = DateTime.now();
  final weekDays = <Widget>[];
  final dayFormatter = DateFormat('EEE', 'fr_FR');
  final monthFormatter = DateFormat('MMM', 'fr_FR');


  for (int i = 0; i < 7; i++) {
    final day = now.add(Duration(days: i));
    weekDays.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: greenColor.withOpacity(0.08),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dayFormatter.format(day).toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            Text(
              '${day.day}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            Text(
              monthFormatter.format(day),
              style: const TextStyle(fontSize: 14,color: Colors.grey ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 40,
              height: 3,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }

  return weekDays;
}
