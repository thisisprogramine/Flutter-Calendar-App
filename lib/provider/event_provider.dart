import 'package:assignment/model/event.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectDate = DateTime.now();

  DateTime get selectedDate => _selectDate;

  void setDate(DateTime date) => _selectDate  = date;

  List<Event> get eventsOfSelectedDate => _events;

  void addEvent(Event event)  {
    _events.add(event);

    notifyListeners();
  }

  void deleteEvent(Event event)  {
    _events.remove(event);

    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent)  {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    notifyListeners();
  }

}