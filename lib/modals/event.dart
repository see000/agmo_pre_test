
import 'package:agmo_pre_test/core/constants/enums.dart';

class EventModel {
  final EventType eventType;
  final String eventDate;
  final String eventName;
  final String eventLocation;
  final String numberOfSlots;
  final String eventThumbnailAssetLocation;

  const EventModel({
    required this.eventType,
    required this.eventDate,
    required this.eventName,
    required this.eventLocation,
    required this.numberOfSlots,
    required this.eventThumbnailAssetLocation,
  });
}