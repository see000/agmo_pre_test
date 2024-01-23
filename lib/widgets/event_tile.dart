import 'package:agmo_pre_test/config/theme/theme.dart';
import 'package:agmo_pre_test/core/constants/enums.dart';
import 'package:agmo_pre_test/core/extensions/enum_extension/enum_extension.dart';
import 'package:flutter/material.dart';

import '../modals/event.dart';
import 'info_label.dart';

class EventTile extends StatelessWidget {
  final EventModel eventModel;
  const EventTile({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: _buildThumbnail(eventModel.eventThumbnailAssetLocation)),
          const SizedBox(
            width: 10,
          ),
          Expanded(flex: 6, child: _buildEventDetails(eventModel)),
        ],
      ),
    );
  }
}

Widget _buildThumbnail(String assetLocation) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40.0, left: 10),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.asset(
        assetLocation,
        fit: BoxFit.cover,
        width: 100,
        height: 110,
      ),
    ),
  );
}

Widget _buildEventDetails(eventModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEventTypeLabel(eventModel.eventType),
        Text(
          eventModel.eventDate,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          eventModel.eventName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        infoLabel(
          label: eventModel.eventLocation,
          infoLabelIcon: const Icon(Icons.location_on_sharp,color: Colors.grey,),
        ),
        const SizedBox(
          height: 5,
        ),
        infoLabel(
          label: eventModel.numberOfSlots,
          infoLabelIcon: const Icon(Icons.person, color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget _buildEventTypeLabel(EventType eventType) {
  return Chip(
    label: Text(eventType.enumToString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
    backgroundColor:  eventTypeLabelColor(eventType),
  );
}
