import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeTasksScreen extends StatelessWidget {
  const HomeTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Calendar Screen'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: _getNextSevenDays(),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      child: Placeholder(),
                    ),
                    title: Text('Caique'),
                    subtitle: Text('Limpeza'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _getNextSevenDays() => DateTime.now().add(Duration(days: 7));
}
