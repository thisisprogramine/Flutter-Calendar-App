import 'package:assignment/widget/calendar_widget.dart';
import 'package:flutter/material.dart';

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Calendar"),
        centerTitle: true,
      ),
      body: CalendarWidget(),
    );
  }
}
