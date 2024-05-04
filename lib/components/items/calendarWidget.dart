import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';

class CalendarWidget extends StatefulWidget {
   CalendarWidget({
    super.key,
   });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedDate = DateTime.now();
  int selectedWeekDay = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 72,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildWeekDays(),
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: GestureDetector(
              onTap: () {
                _selectDate(context);
                // setState(() {
                //   _selectedDate != null
                //       ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                //       : '';
                // });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: greenColor,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: greenColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildWeekDays() {
    initializeDateFormatting('fr_FR', null);

    final now = DateTime.now();
    final weekDays = <Widget>[];
    final dayFormatter = DateFormat('EEE', 'fr_FR');
    final monthFormatter = DateFormat('MMM', 'fr_FR');
    

    for (int i = 0; i < 30; i++) {
      final day = now.add(Duration(days: i));
      weekDays.add(
        GestureDetector(
          onTap: () {
            setState(() {
            selectedWeekDay = i;
            _selectedDate = day;
            print("----------------------------${day}");
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: selectedWeekDay == i
              ? Colors.transparent
              : greenColor.withOpacity(0.08),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayFormatter.format(day).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  '${day.day}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  monthFormatter.format(day),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 40,
                  height: 3,
                  color: selectedWeekDay == i
                  ? primaryColor
                  : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      );
    }

    return weekDays;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

}
