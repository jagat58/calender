import 'dart:math';
import 'package:calender/models/calendar_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../viewmodel/calender_view_model.dart';

class MonthWidget extends StatelessWidget {
  final DateTime focusedDay;
  final Function(DateTime) onPageChanged;

  const MonthWidget({super.key, required this.focusedDay, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CalendarViewModel>(context);

    return Container(
      
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: model.focusedDay,
        rowHeight: 60,
        headerVisible: false,
        daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          return getWeekDayName((date.weekday % 7));
        },
        weekdayStyle: const TextStyle(color: Colors.green, fontSize: 20), // Increased font size
        weekendStyle: const TextStyle(color: Colors.green, fontSize: 20), // Increased font size
        ),
        calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          return _buildDayCell(context, date, model);
        },
        todayBuilder: (context, date, _) {
          return _buildDayCell(context, date, model, isToday: true);
        },
        selectedBuilder: (context, date, _) {
          return _buildDayCell(context, date, model, isSelected: true);
        },
        ),
        calendarStyle: const CalendarStyle(
        outsideDaysVisible: false,
        ),
        selectedDayPredicate: (day) {
        return isSameDay(model.focusedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
        model.onDaySelected(selectedDay);
        },
        onPageChanged: onPageChanged,
      ),
    );
  }

  Widget _buildDayCell(BuildContext context, DateTime date, CalendarViewModel model,
      {bool isToday = false, bool isSelected = false}) {
    final nepaliDate = convertToNepaliNumber(date.day.toString()); 
    final events = model.festivalsForMonth;
    final astrologicalDay = model.astrologicalDayName;
    final englishDate = date.day.toString();

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange
              : isToday
                  ? const Color.fromARGB(255, 236, 186, 186)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
         
        ),
        child: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      englishDate,
                      style: TextStyle(fontSize: 12, color: isSelected || isToday ? Colors.white : Colors.black),
                    ),
                  ],
                ),
              ),
              Text(
                nepaliDate,
                style: TextStyle(fontSize: 22, color: isSelected || isToday ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 2),
              
              Text(
                astrologicalDay,
                style: TextStyle(fontSize: 12, color: isSelected || isToday ? Colors.white : Colors.black),
              ),
              // const SizedBox(height: 4),
              // Text(
              //   events.toString(),
              //   style: TextStyle(fontSize: 10, color: isSelected || isToday ? Colors.white : Colors.black),
              // ),
            ],
          ),
        ),
      ),
    );
}

// Helper functions
List<int> generateNepaliRandomDays(int numberOfDays) {
  final random = Random();
  List<int> days = [];
  for (int i = 0; i < numberOfDays; i++) {
    days.add(random.nextInt(5) + 28); // Generate random days
  }
  return days; // Return raw integers
}

String convertToNepaliNumber(String number) {
  const List<String> nepaliNumbers = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
  return number.split('').map((digit) => nepaliNumbers[int.parse(digit)]).join('');
}


}