// import 'package:flutter/material.dart';
// import '../controllers/calendar_controller.dart';
// import '../models/calendar_models.dart';
// import 'month_widget.dart';

// class CalendarView extends StatefulWidget {
//   const CalendarView({super.key});

//   @override
//   State<CalendarView> createState() => _CalendarViewState();
// }

// class _CalendarViewState extends State<CalendarView> {
//   final CalendarController controller = CalendarController();
//   int selectedMonth = DateTime.now().month;
//   int currentYear = DateTime.now().year;

//   @override
//   Widget build(BuildContext context) {
//     final CalendarModel monthData = controller.getMonthData(selectedMonth, currentYear);

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 12, 120, 192),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 12, 120, 192),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//         IconButton(
//           icon: const Icon(Icons.more_vert , color: Colors.white),
//           onPressed: () {
//           }
//         ),
//         RichText(
//           text: TextSpan(
//             children: [
//           TextSpan(
//             text: '${monthData.month} ',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           TextSpan(
//             text: '${monthData.year}',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
//           ),
//             ],
//           ),
//         ),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: () {
//               },
//             ),
           
//           ],
//         ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 320,
//             child: MonthWidget(monthData: monthData)),
         
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/calendar_controller.dart';
import '../controllers/calender_provider.dart';
import 'month_slider.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final controller = CalendarController();
    final monthData = controller.getMonthData(
      calendarProvider.currentDate.month,
      calendarProvider.currentDate.year,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 120, 192),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 120, 192),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${monthData.month} ',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: '${monthData.year}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 350,
        child: Column(
          children: [
            Expanded(
          child: MonthSlider(monthData: monthData),
            ),
          ],
        ),
      ),
    );
  }
}

