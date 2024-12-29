
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/calendar_models.dart';

class MonthWidget extends StatefulWidget {
  final CalendarModel monthData;

  const MonthWidget({super.key, required this.monthData});

  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
       
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.5), const Color.fromARGB(255, 91, 38, 225).withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: TableCalendar(
                rowHeight: 50,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: widget.monthData.date,
                calendarFormat: CalendarFormat.month,
                availableGestures: AvailableGestures.none,
                headerVisible: false,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                  weekdayStyle: TextStyle(color: Colors.black),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                  ),
                  defaultDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  weekendDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  weekendTextStyle: const TextStyle(color: Colors.red),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  if (selectedDay.weekday != DateTime.saturday) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
