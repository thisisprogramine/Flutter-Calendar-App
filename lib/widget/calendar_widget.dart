import 'package:assignment/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/event_data_source.dart';
import '../screens/event_edit_page.dart';
import 'task_widget.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.white,
      monthViewSettings: MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      onTap: (details) {
        Navigator.of(context).push(MaterialPageRoute(builder: (builder) => EventEditPage()));
      },

      onLongPress: (detail) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(detail.date!);
        showModalBottomSheet(
            context: context,
            builder: (context) => TaskWidget(),
        );
      },

    );
  }
}
