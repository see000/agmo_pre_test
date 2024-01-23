import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/event.dart';
import '../provider/event_list_provider.dart';
import 'event_tile.dart';

class EventListTile extends StatefulWidget {
  const EventListTile({super.key});

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
  late List<EventModel> eventList;
  late EventListProvider eventListProvider ;

  @override
  void initState() {
    eventListProvider = Provider.of<EventListProvider>(context, listen: false);
    eventListProvider.loadEvents();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    eventList = context.watch<EventListProvider>().events;
    return  _buildEventList(eventList);
  }
}

Widget _buildEventList(List<EventModel> eventList) {
  return Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15,),
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        return EventTile(
          eventModel: eventList[index],
        );
      },
    ),
  );
}