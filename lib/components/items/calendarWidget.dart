import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../core/constants.dart';

class LocalizedCalendarWidget extends StatefulWidget {
  const LocalizedCalendarWidget({super.key});

  @override
  State<LocalizedCalendarWidget> createState() => _LocalizedCalendarWidgetState();
}

class _LocalizedCalendarWidgetState extends State<LocalizedCalendarWidget> {
  DateTime? _selectedDate = DateTime.now();
  int selectedWeekDay = 0;

  @override
  Widget build(BuildContext context) {
    // Initialiser la configuration locale
    initializeDateFormatting(Localizations.localeOf(context).toString(), null);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 72,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildWeekDays(context),
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: GestureDetector(
              onTap: () {
                _selectDate(context);
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildWeekDays(BuildContext context) {
    final now = DateTime.now();
    final weekDays = <Widget>[];
    final dayFormatter = DateFormat('EEE', Localizations.localeOf(context).toString());
    final monthFormatter = DateFormat('MMM', Localizations.localeOf(context).toString());

    for (int i = 0; i < 30; i++) {
      final day = now.add(Duration(days: i));
      weekDays.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedWeekDay = i;
              _selectedDate = day;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: selectedWeekDay == i
                  ? Colors.transparent
                  : greenColor.withOpacity(0.07),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayFormatter.format(day).toUpperCase(),
                  style:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                    color: selectedWeekDay == i
                  ? const Color(0xff444B59)
                  : const Color(0xff89898A),
                  ),
                ),
                Text(
                  '${day.day}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                    color: selectedWeekDay == i
                  ? const Color(0xff444B59)
                  : const Color(0xff89898A),
                  ),
                ),
                Text(
                  monthFormatter.format(day),
                  style: const TextStyle(
                    fontSize: 14, 
                    color: Color(0xff89898A),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 40,
                  height: 3,
                  color: selectedWeekDay == i ? primaryColor : Colors.transparent,
                ),
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
