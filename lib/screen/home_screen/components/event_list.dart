import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({
    Key key,
    @required List selectedEvents,
  })  : _selectedEvents = selectedEvents,
        super(key: key);

  final List _selectedEvents;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
