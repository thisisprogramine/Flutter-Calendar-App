import 'package:assignment/provider/event_provider.dart';
import 'package:assignment/screens/event_edit_page.dart';
import 'package:assignment/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/event.dart';

class EventViewPage extends StatelessWidget {
  final Event event;

  const EventViewPage({
    Key? key,
    required this.event
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder) => EventEditPage(event: event,)));
              },
              icon: Icon(Icons.edit)
          ),

          IconButton(
              onPressed: () {
                final provider = Provider.of<EventProvider>(context, listen: false);
                provider.deleteEvent(event);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete)
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          buildDateTime(event),
          SizedBox(height: 32,),
          Text(event.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Text(event.description, style: TextStyle(color: Colors.white, fontSize: 18),)
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        SizedBox(height: 10,),
        if(!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Row(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 18),),
        Expanded(child: Container(),),
        Text('${Utils.toDate(date)} ${Utils.toTime(date)}', style: TextStyle(fontSize: 14))
      ],
    );

  }
}
