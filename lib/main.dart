import 'package:assignment/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calendar_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Calendar App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColorLight: Colors.white,
        ),
        home: CalendarApp(),
      ),
    );
  }
}
